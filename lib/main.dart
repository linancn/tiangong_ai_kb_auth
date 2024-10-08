import 'package:flutter/material.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

import './home.dart';
import './sign_in.dart';
import './magic_link.dart';
import './update_password.dart';
import './phone_sign_in.dart';
import './phone_sign_up.dart';
import './verify_phone.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// TODO: replace with your credentials
  await Supabase.initialize(
    url: 'https://qyyqlnwqwgvzxnccnbgm.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InF5eXFsbndxd2d2enhuY2NuYmdtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTY0Nzg1ODMsImV4cCI6MjAzMjA1NDU4M30.6oJWKKDPtxSjtWm2o_kyqyzNsQT9UBeRyApDGVMt-zg',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TianGong AI Knowledge Base',
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SignUp(),
        '/magic_link': (context) => const MagicLink(),
        '/update_password': (context) => const UpdatePassword(),
        '/phone_sign_in': (context) => const PhoneSignIn(),
        '/phone_sign_up': (context) => const PhoneSignUp(),
        '/verify_phone': (context) => const VerifyPhone(),
        '/home': (context) => const Home(),
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (BuildContext context) => const Scaffold(
            body: Center(
              child: Text(
                'Not Found',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
