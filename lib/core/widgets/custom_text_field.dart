import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.validator,
    this.hintText,
    this.iconData,
    this.showSuffixIcon = false,
    this.onSuffixIconTap,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    this.elevation,
    this.hintStyle,
    this.onChanged,
    this.borderColor = Colors.transparent,
    this.prefixIcon,
    this.activeBorderColor = Colors.transparent,
    this.borderRadius = 12,
    this.contentPadding,
    this.suffix,
    this.filledColor = const Color(0xff2b2b2e),
    this.errorText,
    this.labelText,
    this.labelStyle,
    this.enabled = true,
    this.textStyle,
    this.onTap,
    this.showCursor = true,
    this.height,
    this.width,
    this.maxLines,
    this.expanded = false,
  });

  final TextEditingController controller;
  final Function()? onSuffixIconTap, onTap;
  final Function(dynamic value)? validator, onChanged;
  final String? hintText, labelText;
  final IconData? iconData;
  final bool showSuffixIcon, showCursor;
  final TextInputType textInputType;
  final bool obscureText, enabled, expanded;
  final double? elevation, borderRadius, height, width;
  final TextStyle? hintStyle, labelStyle, textStyle;
  final Color borderColor, activeBorderColor, filledColor;
  final Widget? prefixIcon, suffix;
  final EdgeInsetsGeometry? contentPadding;
  final String? errorText;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        scrollPadding: EdgeInsets.zero,
        onChanged: (value) {
          if (onChanged != null) {
            onChanged!(value);
          }
        },
        onTap: onTap,
        // maxLines: maxLines,
        minLines: null,
        expands: expanded,
        obscureText: obscureText,
        controller: controller,
        showCursor: showCursor,
        style: textStyle,
        keyboardType: textInputType,
        enabled: enabled,
        validator: (value) => validator!(value),
        onTapOutside: (event) => FocusManager.instance.primaryFocus!.unfocus(),
        decoration: InputDecoration(
          errorText: errorText,
          contentPadding: contentPadding,
          prefixIcon: prefixIcon,
          suffixIcon: showSuffixIcon
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: InkWell(
                    onTap: () => onSuffixIconTap!(),
                    child: suffix ?? const SizedBox(),
                  ),
                )
              : null,
          isDense: true,
          filled: false,
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius!)),
            borderSide: BorderSide(color: borderColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius!)),
            borderSide: BorderSide(color: borderColor),
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius!)),
              borderSide: const BorderSide(color: Colors.red)),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius!)),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius!)),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          prefix: const SizedBox(width: 8),
          fillColor: filledColor,
          hintText: hintText,
          labelText: labelText,
          labelStyle: labelStyle ??
              const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Color(0xff828894),
              ),
          hintStyle: hintStyle ??
              const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff828894),
              ),
        ),
      ),
    );
  }
}
