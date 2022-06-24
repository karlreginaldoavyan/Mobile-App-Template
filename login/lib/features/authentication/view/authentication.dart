import 'package:flutter/material.dart';
import 'package:general/widgets/standard_spacing.dart';
import 'package:login/features/authentication/provider/authentication_provider.dart';
import 'package:login/features/authentication/view/login_screen.dart';
import 'package:login/features/authentication/view/protected/home_screen.dart';
import 'package:provider/provider.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StandardMargin(
            horizontal: 15,
            vertical: 15,
            child: context.watch<AuthenticationProvider>().isLoggedIn
                ? const HomeScreen()
                : const LoginScreen()),
      ),
    );
  }
}
