import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_one/widgets/custom_button.dart';
import 'package:project_one/widgets/reprensenting_item.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('assets/images/Frame1.png'),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF1E88E5), width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/signInPage'),
                      child: Text(
                        'Sign In',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Color(0xFF1E88E5),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                Text(
                  'Chuks Kitchen',
                  style: GoogleFonts.islandMoments(
                    fontSize: 40.81,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFFF7A18),
                    height: 1,
                  ),
                ),
                Text(
                  'Your Authentic Taste of Nigeria',
                  style: GoogleFonts.inter(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1F2937),
                    height: 1,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Experience homemade flavors delivered fresh to your desk or home. We bring the rich culinary heritage of Nigeria right to your doorstep.',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF1F2937),
                  ),
                ),
                Column(children: [ReprensentingItem()]),
                SizedBox(height: 5),
                CustomButton(text: 'Start Your Order', onTap: () {}),
                CustomButton(
                  text: 'Learn More Abous us',
                  backgroundColor: Colors.transparent,
                  borderColor: Color(0xFF1E88E5),
                  textColor: Color(0xFF1E88E5),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
