import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_one/widgets/custom_button.dart';
import 'package:project_one/widgets/kitchen_social_button.dart';
import 'package:project_one/widgets/styled_text_field.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final emailController = TextEditingController();
  final passwordContoller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Chuks Kitchen',
                  style: GoogleFonts.islandMoments(
                    fontSize: 40.81,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFFF7A18),
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Login your Account',
                  style: GoogleFonts.inter(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    height: .7,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  StyledTextField(
                    controller: emailController,
                    prefixIcon: Icons.mail,
                    text: 'Email or Phone Number',
                  ),
                  SizedBox(height: 20),
                  StyledTextField(
                    controller: passwordContoller,
                    obscureText: true,
                    prefixIcon: Icons.lock,
                    suffixIcon: Icons.visibility_off,
                    text: 'Password',
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  'Forgot password?',
                  style: GoogleFonts.inter(
                    color: Color(0xFF1E88E5),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              CustomButton(
                text: 'Continue',
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/homePage',
                    (Route<dynamic> route) => false,
                  );
                },
              ),
              const SizedBox(height: 7),
              Row(
                children: [
                  Expanded(child: Divider(thickness: 1)),
                  SizedBox(width: 15),
                  Text(
                    'Or continue with',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(child: Divider(thickness: 1)),
                ],
              ),
              const SizedBox(height: 10),
              KitchenSocialButton(
                text: 'Continue with google',
                icon: 'assets/icons/google.png',
              ),
              const SizedBox(height: 10),
              KitchenSocialButton(
                text: 'Continue with Apple',
                icon: 'assets/icons/fbb.png',
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    child: Text(
                      'Don’t have an account?',
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/signUpPage');
                    },
                    child: Align(
                      child: Text(
                        'Create an account',
                        style: GoogleFonts.inter(
                          color: Color(0xFF1C7FF9),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
