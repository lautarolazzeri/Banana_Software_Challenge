import 'package:app/constants/constants.dart';
import 'package:flutter/material.dart';

class LoginInput extends StatefulWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final Icon prefixIcon;
  final Icon? suffixIcon;

  const LoginInput(
      {required this.textEditingController,
      required this.hintText,
      Key? key,
      required this.prefixIcon,
      this.suffixIcon})
      : super(key: key);

  @override
  State<LoginInput> createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> {
  bool pwdVisibility = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      obscureText: widget.suffixIcon != null ? pwdVisibility : false,
      decoration: InputDecoration(
        hintText: widget.hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: colorError,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: colorError,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon != null
            ? IconButton(
                onPressed: () {
                  setState(() {
                    pwdVisibility = !pwdVisibility;
                  });
                },
                icon: Icon(
                  pwdVisibility ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                  color: grey.shade400,
                  size: 18,
                ),
              )
            : null,
      ),
      validator: (val) {
        if (val!.isEmpty) {
          return 'Por favor completa este campo';
        }
        return null;
      },
    );
  }
}
