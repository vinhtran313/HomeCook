import 'package:boilerplate/constants/colors.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final IconData? icon;
  final String? hint;
  final String? errorText;
  final bool isObscure;
  final bool isIcon;
  final TextInputType? inputType;
  final TextEditingController textController;
  final EdgeInsets padding;
  final Color hintColor;
  final Color iconColor;
  final FocusNode? focusNode;
  final ValueChanged? onFieldSubmitted;
  final ValueChanged? onChanged;
  final bool autoFocus;
  final TextInputAction? inputAction;
  final int? maxLines;
  final InputBorder? focusBorder;
  final InputBorder? inputBorder;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        controller: textController,
        minLines: 1,
        maxLines: maxLines != null ? maxLines : 1,
        focusNode: focusNode,
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
        autofocus: autoFocus,
        textInputAction: inputAction,
        textAlign: this.textAlign,
        obscureText: this.isObscure,
        keyboardType: this.inputType,
        style: Theme.of(context).textTheme.body1,
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.black),
          hintText: this.hint,
          hintStyle:
              Theme.of(context).textTheme.body1!.copyWith(color: hintColor),
          errorText: errorText,
          counterText: '',
          enabledBorder: this.inputBorder != null
              ? this.inputBorder
              : UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black38, width: 1.5),
                ),
          icon: this.isIcon ? Icon(this.icon, color: iconColor) : null,
          focusedBorder: this.focusBorder != null
              ? this.focusBorder
              : UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColors.appColor['orangeMain']!, width: 1.5)),
        ),
      ),
    );
  }

  const TextFieldWidget({
    Key? key,
    this.icon,
    this.errorText,
    this.maxLines,
    required this.textController,
    this.inputType,
    this.hint,
    this.textAlign = TextAlign.start,
    this.focusBorder,
    this.inputBorder,
    this.isObscure = false,
    this.isIcon = true,
    this.padding = const EdgeInsets.all(0),
    this.hintColor = Colors.grey,
    this.iconColor = Colors.grey,
    this.focusNode,
    this.onFieldSubmitted,
    this.onChanged,
    this.autoFocus = false,
    this.inputAction,
  }) : super(key: key);
}
