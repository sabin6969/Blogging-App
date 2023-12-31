import 'package:flutter/material.dart';
import 'package:mvc_app/controller/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  late LoginController loginController;

  @override
  void dispose() {
    loginController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    loginController = LoginController(
        emailController: _emailController,
        passwordController: _passwordController,
        globalKey: _globalKey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: Form(
          key: loginController.globalKey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) => loginController.validateEmail(
                  loginController.emailController.text,
                ),
                controller: loginController.emailController,
              ),
              TextFormField(
                validator: (value) => loginController.validatePassword(
                  loginController.passwordController.text,
                ),
                controller: loginController.passwordController,
              ),
              MaterialButton(
                onPressed: () {
                  loginController.login();
                },
                child: const Text("Hit me"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
