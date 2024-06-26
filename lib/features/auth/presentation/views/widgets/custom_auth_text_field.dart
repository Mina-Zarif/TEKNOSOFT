import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class CustomAuthTextField extends StatelessWidget {
  const CustomAuthTextField({
    super.key,
    required this.controller,
    this.validator,
    required this.label,
    required this.iconData,
    this.isPassword = false,
    this.changeIconsFun,
    this.passIconData,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
  });

  final TextEditingController controller;
  final Function()? changeIconsFun;
  final Function(dynamic value)? validator;
  final String label;
  final IconData iconData;
  final bool isPassword;
  final IconData? passIconData;
  final TextInputType textInputType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      cursorColor: kMainColor,
      cursorHeight: 22,
      keyboardType: textInputType,
      validator: (value) => validator!(value),
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      decoration: InputDecoration(
        suffixIcon: isPassword
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: InkWell(
                  onTap: () => changeIconsFun!(),
                  child: Icon(passIconData),
                ),
              )
            : null,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kMainColor),
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        filled: true,
        fillColor: Colors.grey[200],
        hoverColor: kMainColor,
        prefixIconColor: kMainColor,
        suffixIconColor: kMainColor,
        label: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(label),
        ),

      ),
    );
  }
}
