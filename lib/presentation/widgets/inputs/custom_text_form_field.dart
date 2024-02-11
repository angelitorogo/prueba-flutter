import 'package:flutter/material.dart';

class CustomTextFormfield extends StatelessWidget {

  final String? label;
  final String? hint;
  final String? errorMessage;
  final bool obscureText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;


  const CustomTextFormfield({
    super.key, 
    this.label, 
    this.hint, 
    this.errorMessage, 
    this.onChanged, 
    this.validator, 
    this.obscureText = false
  });

  @override
  Widget build(BuildContext context) {

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(
        color: Colors.white60
      )

    );

    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      cursorColor: Colors.white,
      
      decoration: InputDecoration(
        enabledBorder: border,
        border: border,
        focusedBorder: border.copyWith( borderSide:  const BorderSide( color:  Colors.white)),
        errorBorder: border.copyWith( borderSide:  BorderSide( color: Colors.red.shade800)),
        focusedErrorBorder: border.copyWith( borderSide:  BorderSide( color: Colors.red.shade800)),
        isDense: true,        
        
        label: label != null ? Text(label!, style: const TextStyle(color: Colors.white),) : null,
        hintText: hint,  // or null
        errorText: errorMessage, // or null
        
  

      ),
    );

  }
}