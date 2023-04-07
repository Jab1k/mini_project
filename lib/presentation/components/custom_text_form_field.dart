import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? Function(String? value)? validator;
  final Widget? icon;
  final TextEditingController? controller;

  const CustomTextFormField(
      {Key? key, this.label, this.validator,  this.icon, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.labelMedium,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
          labelText: label,
          suffixIcon: icon,
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(),
          enabledBorder: const OutlineInputBorder(),
          errorBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.error))),
    );
  }
}
