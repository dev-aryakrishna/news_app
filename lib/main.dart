import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/constants/env_constants.dart';
import ' dependency_injection/injection.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await Supabase.initialize(
    url: EnvConstants.supabaseUrl,
    publishableKey: EnvConstants.supabaseAnonKey,
  );
  await configureDependencies();
  runApp(const App());
}

