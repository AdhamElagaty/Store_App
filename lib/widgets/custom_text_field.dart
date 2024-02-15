import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.labelText,
    @required this.prefixText,
    required this.getData,
  });

  final String hintText;
  final String labelText;
  final String? prefixText;
  final Function(String) getData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        initialValue: prefixText,
        onChanged: getData,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          floatingLabelStyle: const TextStyle(
            color: Colors.black,
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 100, 185, 255)),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
