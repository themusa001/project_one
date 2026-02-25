import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_one/widgets/custom_button.dart';
import 'package:project_one/widgets/kitchen_social_button.dart';
import 'package:project_one/widgets/styled_text_field.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();

  final passwordContoller = TextEditingController();

  final phoneNumberController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  bool _isAgreed = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
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
                    'Create your Account',
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      height: .7,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                StyledTextField(
                  controller: emailController,
                  text: 'Email',
                  prefixIcon: Icons.mail,
                ),
                const SizedBox(height: 10),
                StyledTextField(
                  controller: phoneNumberController,
                  text: 'Phone Number',
                  prefixIcon: Icons.phone,
                ),
                const SizedBox(height: 10),
                StyledTextField(
                  controller: passwordContoller,
                  text: 'Password',
                  prefixIcon: Icons.lock,
                  suffixIcon: Icons.visibility_off,
                ),
                const SizedBox(height: 10),
                StyledTextField(
                  controller: confirmPasswordController,
                  text: 'Confirm passowrd',
                  prefixIcon: Icons.lock,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Checkbox(
                      activeColor: Color(0xFF1E88E5),
                      value: _isAgreed,
                      onChanged: (value) {
                        setState(() {
                          _isAgreed = value!;
                        });
                      },
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          text: 'I agree to the ',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: 'Terms & Conditions ',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF1E88E5),
                              ),
                            ),

                            TextSpan(
                              text: 'and ',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF1E88E5),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                CustomButton(
                  text: 'Continue',
                  onTap: () {
                    Navigator.pushNamed(context, '/signInPage');
                  },
                ),
                const SizedBox(height: 7),
                Row(
                  children: [
                    Expanded(child: Divider(thickness: 1)),
                    const SizedBox(width: 15),
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
                        'Already have an account?',
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Align(
                      child: Text(
                        'Sign in',
                        style: GoogleFonts.inter(
                          color: Color(0xFF1C7FF9),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
