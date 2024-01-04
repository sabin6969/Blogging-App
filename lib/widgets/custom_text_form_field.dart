import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final bool isObsecure;
  final IconData prefixIconData;
  final String? Function(String?) validator;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final IconButton? suffixIconButton;
  final FocusNode currentNode;
  final FocusNode? nextNode;

  const CustomTextFormField({
    Key? key,
    required this.labelText,
    required this.isObsecure,
    required this.prefixIconData,
    required this.textEditingController,
    required this.validator,
    required this.textInputType,
    required this.currentNode,
    this.suffixIconButton,
    this.nextNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: currentNode,
      keyboardType: textInputType,
      validator: validator,
      obscureText: isObsecure,
      onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(
          nextNode,
        );
      },
      controller: textEditingController,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(prefixIconData),
        suffixIcon: suffixIconButton,
      ),
    );
  }
}
