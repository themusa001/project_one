import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KitchenSocialButton extends StatelessWidget {
  final String text;
  final String icon;
  final VoidCallback? ontap;

  const KitchenSocialButton({
    super.key,
    required this.text,
    required this.icon,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),

      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(icon, height: 20),
          SizedBox(width: 5),
          Text(
            text,
            style: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
