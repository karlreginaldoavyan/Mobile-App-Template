import 'package:flutter/material.dart';
import 'package:general/general.dart';
import 'package:login/features/authentication/provider/authentication_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StandardMargin(
          horizontal: 15,
          vertical: 15,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  'Welcome ${context.watch<AuthenticationProvider>().userData.user.email}!',
                  type: Type.headline6,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 50,
                ),
                const CustomText(
                  'Insert your home screen here!',
                  type: Type.body2,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
