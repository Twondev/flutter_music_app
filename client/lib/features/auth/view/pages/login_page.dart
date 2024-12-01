import 'package:client/core/theme/app_pallete.dart';
import 'package:client/features/auth/view/widgets/client/lib/features/auth/view/widgets/auth_gradient_button.dart';
import 'package:client/features/auth/view/widgets/custom_feild.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final nameController = TextEditingController();
  final emialController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose

    emialController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sign In.',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomFeild(
                hintText: 'Email',
                controller: emialController,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomFeild(
                hintText: 'Password',
                controller: passwordController,
                isObscrureText: true,
              ),
              const SizedBox(
                height: 20,
              ),
              AuthGradientButton(
                buttonText: 'Sign In',
                onTap: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              RichText(
                  text: TextSpan(
                text: 'don\'t have an account? ',
                style: Theme.of(context).textTheme.titleMedium,
                children: const [
                  TextSpan(
                      text: 'Sign Up',
                      style: TextStyle(
                          color: Pallete.gradient2,
                          fontWeight: FontWeight.bold)),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
