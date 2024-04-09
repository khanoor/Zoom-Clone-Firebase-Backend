import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/auth_method.dart';
import 'package:zoom_clone/widgets/custome_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethod _authMethod = AuthMethod();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Start or join meeting",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Image.asset("assets/images/onboarding.jpg"),
          CustomButton(
              text: "Google Sign In",
              onPressed: () async {
                bool res = await _authMethod.signInWithGoogle(context);
                if (res) {
                  Navigator.pushNamed(context, '/home');
                }
              })
        ],
      ),
    );
  }
}
