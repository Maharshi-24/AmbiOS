import 'package:ambios/auth/auth_service.dart';
import 'package:ambios/components/my_button.dart';
import 'package:ambios/components/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();

  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  void register(BuildContext context) async {
    final _auth = AuthService();

    if (_pwController.text != _confirmPwController.text) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error: Passwords do not match.'),
        ),
      );
      return;
    }

    try {
      await _auth.signUpWithEmailPassword(
        _emailController.text,
        _pwController.text,
      );
      // Registration successful, navigate to next page or perform other actions
    } on Exception catch (e) {
      if (e.toString().contains('weak-password')) {
        // Handle weak password error
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Error: The password provided is too weak.'),
          ),
        );
      } else if (e.toString().contains('email-already-in-use')) {
        // Handle email already in use error
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Error: The account already exists for that email.'),
          ),
        );
      } else {
        // Handle other errors
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Icon(
            Icons.message,
            size: 60,
            color: Theme.of(context).colorScheme.primary,
          ),

          const SizedBox(height: 50),

          Text(
              "Lets create an account for you!",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              )
          ),

          const SizedBox(height: 25),

          MyTextfield(
            hintText: "Email",
            obscureText: false,
            controller: _emailController,

          ),

          const SizedBox(height: 10),

          MyTextfield(
            hintText: "Password",
            obscureText: true,
            controller: _pwController,
          ),

          const SizedBox(height: 10),

          MyTextfield(
            hintText: "Confirm Password",
            obscureText: true,
            controller: _confirmPwController,
          ),

          const SizedBox(height: 25),

          MyButton(
            text: "Register",
            onTap: () => register(context),
          ),

          const SizedBox(height: 25),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account? ",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              GestureDetector(
                onTap: onTap,
                child: Text(
                  "Login now",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
