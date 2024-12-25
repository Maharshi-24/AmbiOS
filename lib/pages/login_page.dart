import 'package:ambios/auth/auth_service.dart';
import 'package:ambios/components/my_button.dart';
import 'package:ambios/components/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  final void Function()? onTap;

  LoginPage({super.key, required this.onTap});

  void login(BuildContext context) async {
    final authService = AuthService();

    try {
      await authService.signInWithEmailPassword(_emailController.text, _pwController.text);
      // Login successful, navigate to next page or perform other actions
    } on Exception catch (e) {
      if (e.toString().contains('channel-error')) {
        // Handle channel-error specifically
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Error: Channel error occurred. Please try again.'),
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
            "Welcome back, you have been missed!",
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

          const SizedBox(height: 25),

          MyButton(
            text: "Login",
            onTap: () => login(context),
          ),

          const SizedBox(height: 25),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Not a member? ",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              GestureDetector(
                onTap: onTap,
                child: Text(
                    "Register now",
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
