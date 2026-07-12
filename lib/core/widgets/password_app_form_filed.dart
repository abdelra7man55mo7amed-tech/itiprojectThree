import 'package:flutter/material.dart';
import 'package:itiprojectthree/core/widgets/app_form_fild.dart';

class PasswordAppFormFiled extends StatefulWidget {
  const PasswordAppFormFiled({
    super.key,
    required this.textEditingController,
    required this.title,
    required this.validator,
  });

  final TextEditingController textEditingController;
  final String title;
  final String? Function(String?) validator;

  @override
  State<PasswordAppFormFiled> createState() => _PasswordAppFormFiledState();
}

class _PasswordAppFormFiledState extends State<PasswordAppFormFiled> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return AppFormFild(
      title: widget.title,
      textEditingController: widget.textEditingController,
      validator: widget.validator,
      obscureText: obscureText,
      iconButton: IconButton(
        onPressed: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
      ),
    );
  }
}
