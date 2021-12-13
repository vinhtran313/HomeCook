import 'package:boilerplate/constants/colors.dart';
import 'package:flutter/material.dart';

class Arguments {
  final String message;

  Arguments({required this.message});
}

class SearchBar extends StatefulWidget {
  final TextEditingController controller;

  SearchBar({required this.controller});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    final routeName = ModalRoute.of(context)?.settings.name;

    return TextField(
      controller: widget.controller,
      onSubmitted: (value) {
        if (routeName != '/search') {
          Navigator.pushNamed(context, '/search',
              arguments: {'message': value});
        }
      },
      decoration: InputDecoration(
        prefixIcon: routeName != '/search'
            ? Icon(
                Icons.search,
                color: Colors.black,
              )
            : null,
        suffixIcon: routeName == '/search'
            ? Icon(
                Icons.search,
                color: Colors.black,
              )
            : null,
        fillColor: routeName != '/search'
            ? Color.fromRGBO(235, 235, 235, 1.0)
            : Colors.transparent,
        filled: true,
        hintText: "Search",
        hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: routeName != '/search'
                ? AppColors.appColor['orangeMain']!
                : Colors.transparent,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
      ),
    );
  }
}
