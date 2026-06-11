import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/%20dependency_injection/injection.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/utilis/validators.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import 'package:go_router/go_router.dart';
import '../../../../routes/route_names.dart';

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
 @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => sl<AuthBloc>(),
     child :Builder(builder:(context) {
      return
     Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
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
          

                  PrimaryButton(
                     text: 'Login',
                    onPressed: (){
                      debugPrint("Button clicked");
                      if(_formKey.currentState!.validate()) {
                      debugPrint("Validation passed");

                        context.read<AuthBloc>().add(
                          LoginRequested(
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim(),
                          ),
                          
                        ); 
                      debugPrint(" Event added");

                      }
                    }
                  ),


                   const SizedBox(height: 16),


                  TextButton(
                   onPressed: () {
                    context.push(RouteNames.signup);

                     },
                   child: Text("Don't have an account? Sign up"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    
    );
  }),);
    
  }
}

        
