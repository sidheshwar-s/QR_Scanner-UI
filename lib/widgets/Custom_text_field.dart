import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final double horizontal_padding;
  final Icon? suffixIcons;
  const CustomTextField(
      {Key? key,
      this.hintText,
      required this.horizontal_padding,
      this.suffixIcons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontal_padding),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(width: 2, color: Theme.of(context).accentColor)),
          focusedBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(width: 2, color: Theme.of(context).accentColor)),
          suffixIcon: suffixIcons == null ? SizedBox() : suffixIcons,
        ),
      ),
    );
  }
}
