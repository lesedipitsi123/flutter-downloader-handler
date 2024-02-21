import 'package:flutter/material.dart';

class PhoneNumberField extends StatelessWidget {
  const PhoneNumberField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.phone,
      cursorColor: Theme.of(context).colorScheme.inverseSurface,
      style: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.phone,
            size: 20.0, color: Theme.of(context).colorScheme.primary),
        fillColor: Theme.of(context).colorScheme.surfaceVariant,
        filled: true,
        labelText: "Phone number",
        labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.normal,
            color: Theme.of(context).colorScheme.inverseSurface),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}
