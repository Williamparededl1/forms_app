import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final String? errorText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final bool? obscureText;

  const CustomTextFormField(
      {super.key,
      this.label,
      this.hintText,
      this.errorText,
      this.onChanged,
      this.validator,
      this.prefixIcon,
      this.obscureText});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final enableBorder = OutlineInputBorder(
        borderSide: BorderSide(color: colors.primary),
        borderRadius: BorderRadius.circular(20));

    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText != null ? obscureText! : false,
      decoration: InputDecoration(
          enabledBorder: enableBorder,
          focusedBorder: enableBorder.copyWith(
              borderSide: BorderSide(color: colors.secondary)),
          errorBorder: enableBorder.copyWith(
              borderSide: const BorderSide(color: Colors.red)),
          focusedErrorBorder: enableBorder.copyWith(
              borderSide: const BorderSide(color: Colors.red)),
          isDense: true,
          label: label != null ? Text(label!) : null,
          hintText: hintText,
          focusColor: colors.primary,
          prefixIcon: prefixIcon,
          errorText: errorText),
    );
  }
}
