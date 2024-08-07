import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.hintColor,
    this.onChange,
    this.validator,
    this.controller,
    this.expand,
    this.radius,
    this.maxLines,
    this.color,
  });
  final String? hintText;
  final Icon? prefixIcon;
  final Color? hintColor;
  final Function(String?)? onChange;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool? expand;
  final double? radius;
  final int? maxLines;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      controller: controller,
      validator: validator,
      onChanged: onChange,
      decoration: InputDecoration(
          prefixIcon: prefixIcon,
          hintText: hintText,
          hintStyle: TextStyle(color: hintColor ?? Colors.grey),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius ?? 30))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius ?? 30)),
              borderSide: BorderSide(
                color: color ?? Color.fromARGB(255, 41, 104, 155),
              ))),
    );
  }
}
