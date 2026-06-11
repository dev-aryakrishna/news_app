import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/%20dependency_injection/injection.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/utilis/validators.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';


class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
      ),
      body: Center(
        child: Text("Signup Page"),
      ),
    );
  }
}