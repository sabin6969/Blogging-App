import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String labelText;
  final bool isObsecure;
  final IconData iconData;
  final TextEditingController textEditingController;
  const CustomTextFormField(
      {super.key,
      required this.labelText,
      required this.isObsecure,
      required this.iconData,
      required this.textEditingController});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isObsecure,
      controller: widget.textEditingController,
      decoration: InputDecoration(
        labelText: widget.labelText,
        prefixIcon: Icon(widget.iconData),
      ),
    );
  }
}
