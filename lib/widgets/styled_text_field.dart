import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool? obscureText;
  final IconData? prefixIcon;
  final String text;
  final IconData? suffixIcon;
  final double? fontSize;
  const StyledTextField({
    super.key,
    required this.controller,
    this.obscureText,
    this.fontSize,
    this.prefixIcon,
    this.suffixIcon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 10),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 1),
            ),
            prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
            suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
          ),
        ),
      ],
    );
  }
}
