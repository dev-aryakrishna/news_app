import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/utilis/validators.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_bloc.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  @override
  State<SignupPage> createState() => _SignupPage();
}

class _SignupPage extends State<SignupPage> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController = TextEditingController();

      
  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SignUp")),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formkey,
              child: Column(
                children: [
                  CustomTextField(
                    controller: _nameController,
                    hintText: 'Name',
                    validator: Validators.validateName,
                  ),

                  SizedBox(height: 16),

                  CustomTextField(
                    controller: _phoneController,
                    hintText: 'Phone Number',
                    validator: Validators.validatePhone,
                  ),

                  SizedBox(height: 16),

                  CustomTextField(
                    controller: _emailController,
                    hintText: 'Email',
                    validator: Validators.validateEmail,
                  ),

                  SizedBox(height: 16),

                  CustomTextField(
                    controller: _passwordController,
                    hintText: 'Password',
                    obscureText: true,
                    validator: Validators.validatePassword,
                  ),

                  SizedBox(height: 16),

                  CustomTextField(
                    controller: _confirmpasswordController,
                    hintText: 'Password',
                    obscureText: true,
                    validator: (value)=>Validators.validateConfirmPassword(value , _passwordController.text),
                  ),

                  SizedBox(height: 16),

                  PrimaryButton(text: "Signup", onPressed: (){
                    if(_formkey.currentState!.validate()){
                      print("signup button clicked");
                      context.read<AuthBloc>().add(SignUpRequested(
                        fullname : _nameController.text.trim(),
                        phone : _phoneController.text.trim(),
                        email : _emailController.text.trim(),
                        password : _passwordController.text.trim()
                      ));
                    }
                  }),

                  SizedBox(height: 16),

                  TextButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: Text("Already have Account?Login"))
                 
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
