import 'package:boilerplate/data/sharedpref/shared_preference_helper.dart';
import 'package:boilerplate/models/login/login.dart';
import 'package:boilerplate/models/login/register.dart';
import 'package:boilerplate/stores/error/error_store.dart';
import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';
import 'package:boilerplate/data/repository.dart';

part 'form_store.g.dart';

class FormStore = _FormStore with _$FormStore;

abstract class _FormStore with Store {
  // repository instance
  late Repository _repository;

  late SharedPreferenceHelper _sharedPrefsHelper;

  // store for handling form errors
  final FormErrorStore formErrorStore = FormErrorStore();

  // store for handling error messages
  final ErrorStore errorStore = ErrorStore();

  _FormStore(
      Repository repository, SharedPreferenceHelper sharedPreferenceHelper) {
    this._repository = repository;
    this._sharedPrefsHelper = sharedPreferenceHelper;
    _setupValidations();
  }

  // disposers:-----------------------------------------------------------------
  late List<ReactionDisposer> _disposers;

  void _setupValidations() {
    _disposers = [
      reaction((_) => userEmail, validateUserEmail),
      reaction((_) => password, validatePassword),
      reaction((_) => confirmPassword, validateConfirmPassword),
      reaction((_) => userName, validateUserName),
    ];
  }

  // store variables:-----------------------------------------------------------
  @observable
  String userEmail = '';

  @observable
  String userPhone = '';

  @observable
  String userName = '';

  @observable
  String password = '';

  @observable
  String confirmPassword = '';

  @observable
  bool success = false;

  @observable
  bool loading = false;

  @observable
  Object registerResponse = {};

  @observable
  Object loginResponse = {};

  @computed
  bool get canLogin =>
      !formErrorStore.hasErrorsInLogin &&
      userEmail.isNotEmpty &&
      password.isNotEmpty;

  @computed
  bool get canRegister =>
      !formErrorStore.hasErrorsInRegister &&
      userPhone.isNotEmpty &&
      userName.isNotEmpty &&
      password.isNotEmpty;

  @computed
  bool get canForgetPassword =>
      !formErrorStore.hasErrorInForgotPassword && userEmail.isNotEmpty;

  // actions:-------------------------------------------------------------------
  @action
  void setUserId(String value) {
    userEmail = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  void setUserName(String value) {
    userName = value;
  }

  @action
  void setConfirmPassword(String value) {
    confirmPassword = value;
  }

  @action
  void validateUserPhone(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      formErrorStore.userPhone = 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      formErrorStore.userPhone = 'Please enter a valid mobile number';
    } else {
      return formErrorStore.userPhone = null;
    }
  }

  @action
  void validateUserName(String value) {
    String pattern = '[a-zA-Z]';
    RegExp regExp = new RegExp(pattern);
    if (value.isEmpty) {
      formErrorStore.userName = "Name can't be empty";
    } else if (!regExp.hasMatch(value)) {
      formErrorStore.userName = 'Please enter a valid user name';
    } else {
      formErrorStore.userName = null;
    }
  }

  @action
  void validateUserEmail(String value) {
    if (value.isEmpty) {
      formErrorStore.userEmail = "Email can't be empty";
    } else if (!isEmail(value)) {
      formErrorStore.userEmail = 'Please enter a valid email address';
    } else {
      formErrorStore.userEmail = null;
    }
  }

  @action
  void validatePassword(String value) {
    if (value.isEmpty) {
      formErrorStore.password = "Password can't be empty";
    } else if (value.length < 8) {
      formErrorStore.password = "Password must be at-least 8 characters long";
    } else {
      formErrorStore.password = null;
    }
  }

  @action
  void validateConfirmPassword(String value) {
    if (value.isEmpty) {
      formErrorStore.confirmPassword = "Confirm password can't be empty";
    } else if (value != password) {
      formErrorStore.confirmPassword = "Password doen't match";
    } else {
      formErrorStore.confirmPassword = null;
    }
  }

  @action
  Future register(Function onPress) async {
    loading = true;
    final future = _repository.getRegister(userName, userPhone, password);
    registerResponse = ObservableFuture(future);
    await future.then((value) async {
      loading = false;
      print(value);
      onPress(value);
    }).catchError((e) {
      loading = false;
      success = false;
      print(e);
      throw e;
    });
  }

  @action
  Future login(Function onPress) async {
    loading = true;
    final future = _repository.login(userPhone, password);
    print(future);
    loginResponse = ObservableFuture(future);
    await future.then((value) async {
      loading = false;
      success = true;
      _repository.saveIsLoggedIn(true);
      print(value);
      final res = Login.fromJson(value);
      dynamic token = res.data?.token;
      _sharedPrefsHelper.saveIsLoggedIn(true);
      _sharedPrefsHelper.saveAuthToken(token);
      print(value);
      onPress(value);
    }).catchError((e) {
      loading = false;
      success = false;
      errorStore.errorMessage = e.toString().contains("ERROR_USER_NOT_FOUND")
          ? "Username and password doesn't match"
          : "Something went wrong, please check your internet connection and try again";
      print(e);
    });
  }

  @action
  Future forgotPassword() async {
    loading = true;
  }

  @action
  Future logout() async {
    loading = true;
  }

  // general methods:-----------------------------------------------------------
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  void validateAll() {
    validatePassword(password);
    validateUserPhone(userPhone);

    // validateUserEmail(userEmail);
  }
}

class FormErrorStore = _FormErrorStore with _$FormErrorStore;

abstract class _FormErrorStore with Store {
  @observable
  String? userEmail;

  @observable
  String? userPhone;

  @observable
  String? userName;

  @observable
  String? password;

  @observable
  String? confirmPassword;

  @computed
  bool get hasErrorsInLogin => userEmail != null || password != null;

  @computed
  bool get hasErrorsInRegister =>
      userEmail != null || password != null || confirmPassword != null;

  @computed
  bool get hasErrorInForgotPassword => userEmail != null;
}
