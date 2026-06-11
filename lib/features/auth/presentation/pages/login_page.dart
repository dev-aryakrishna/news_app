import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/utilis/validators.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  void _onLogin() {
    if(_formKey.currentState!.validate()) {
      debugPrint("Login successful");
   }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            CustomTextField(
              controller: _emailController,
              hintText: 'Email',
              validator:Validators.validateEmail,
            ),

            SizedBox(height: 16),

            CustomTextField(
              controller: _passwordController,
              hintText: 'Password',
              obscureText: true,
              validator:Validators.validatePassword,
            ),

            SizedBox(height: 24),

            PrimaryButton(
              text: 'Login',
              onPressed : _onLogin
            ),

           const SizedBox(height: 16),
            TextButton(onPressed: () {
              // Navigate to Signup Page
            }, child: Text("Don't have an account? Sign up")
              
            )
          ],
        ),
      ),
    );
  }
}
