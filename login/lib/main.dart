import 'package:flutter/material.dart';
import 'package:login/features/authentication/view/authentication.dart';
import 'package:provider/provider.dart';

import 'features/authentication/provider/authentication_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (ctx) => AuthenticationProvider(),
        child: const AuthenticationScreen(),
      ),
    );
  }
}
