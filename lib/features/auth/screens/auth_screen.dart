import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/common/widgets/custom_textfield.dart';
import 'package:grocery_app/features/auth/services/authservice.dart';

enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth auth = Auth.signup;
  final AuthService authService = AuthService();
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
    );
  }

  void signInUser() {
    authService.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (auth == Auth.signup)
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Form(
              key: _signUpFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sign Up",
                    style: GoogleFonts.signikaNegative(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    "We are happy to see you here!",
                    style: GoogleFonts.signikaNegative(
                        fontSize: 14, color: Color(0xFFC6C6C6)),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: CustomTextField(
                        controller: _nameController,
                        icon: Icon(Icons.person_outline),
                        hintText: "Name",
                      ))
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: CustomTextField(
                        controller: _emailController,
                        icon: Icon(Icons.mail_outline),
                        hintText: "Email",
                      ))
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CustomTextField(
                          controller: _passwordController,
                          icon: Icon(Icons.key_outlined),
                          hintText: "Password",
                          obsecuretext: true,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints.expand(
                        width: double.infinity, height: 50),
                    child: TextButton(
                        onPressed: () {
                          if (_signUpFormKey.currentState!.validate()) {
                            signUpUser();
                          }
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xFF393E46)),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25))),
                            alignment: Alignment.center),
                        child: Text(
                          "Sign up me",
                          style: GoogleFonts.signikaNegative(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        )),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          auth = Auth.signin;
                        });
                      },
                      child: Text(
                        "Already have an account?",
                        style: GoogleFonts.signikaNegative(
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            color: Color(0xFF393E46)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    else {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 40,
            ),
            child: Form(
              key: _signInFormKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome",
                      style: GoogleFonts.signikaNegative(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                    Text(
                      "Back!",
                      style: GoogleFonts.signikaNegative(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      "Hey! Good to see you again.",
                      style: GoogleFonts.signikaNegative(fontSize: 14),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    Text(
                      "Sign in",
                      style: GoogleFonts.signikaNegative(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CustomTextField(
                              controller: _emailController,
                              icon: Icon(Icons.mail_outline),
                              hintText: "Email"),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CustomTextField(
                            controller: _passwordController,
                            icon: Icon(Icons.key_outlined),
                            hintText: "Password",
                            obsecuretext: true,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints.expand(
                          width: double.infinity, height: 50),
                      child: TextButton(
                          onPressed: () {
                            if (_signInFormKey.currentState!.validate()) {
                              signInUser();
                            }
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xFF393E46)),
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25))),
                              alignment: Alignment.center),
                          child: Text(
                            "Sign in",
                            style: GoogleFonts.signikaNegative(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          )),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            auth = Auth.signup;
                          });
                        },
                        child: Text(
                          "Don't have an account?",
                          style: GoogleFonts.signikaNegative(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: Color(0xFF393E46)),
                        ),
                      ),
                    )
                  ]),
            ),
          ),
        ),
      );
    }
  }
}
