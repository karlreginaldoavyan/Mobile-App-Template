import 'package:flutter/material.dart';
import 'package:general/general.dart';

class TextFieldScreen extends StatefulWidget {
  const TextFieldScreen({Key? key}) : super(key: key);

  @override
  State<TextFieldScreen> createState() => _TextFieldScreenState();
}

class _TextFieldScreenState extends State<TextFieldScreen> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
        CustomText(
          'Custom Text Field',
          color: Colors.grey,
          type: Type.headline6,
          weight: FontWeight.bold,
        ),
        SizedBox(
          height: 10,
        ),
        CustomTextField(
          'Email',
          controller: null,
          validator: emailValidator,
        ),
        SizedBox(
          height: 5,
        ),
        CustomTextField(
          'Password',
          controller: null,
          obscureText: true,
          validator: passwordValidator,
          keyboard: TextInputType.visiblePassword,
        ),
        SizedBox(
          height: 5,
        ),
        CustomTextField(
          'Email',
          prefix: Icon(Icons.email),
          validator: emailValidator,
          controller: null,
        ),
        SizedBox(
          height: 5,
        ),
        CustomTextField(
          'Password',
          controller: null,
          validator: passwordValidator,
          prefix: Icon(Icons.password),
          obscureText: true,
          keyboard: TextInputType.visiblePassword,
        ),
      ]),
    );
  }
}
