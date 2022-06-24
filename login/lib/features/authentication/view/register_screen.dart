import 'package:flutter/material.dart';
import 'package:general/general.dart';
import 'package:login/features/authentication/core/utils/form_key/register_key.dart';
import 'package:login/features/authentication/core/utils/text_editing_controller/register_text_controller.dart';
import 'package:provider/provider.dart';

import '../model/input/user_register.dart';
import '../provider/authentication_provider.dart';

/// The [RegisterScreen] function list:
/// - LoginButton [connect to api and expect a response]
///*  if Success
///*    - The Screen will redirect to MainScreen (Protected)
/// !  if Error
/// !    - The Screen will stay to RegisterScreen
/// !    - Will Pop up an error message
/// Required Dependencies:
/* 
general:
    git:
      url: https://github.com/FlutterStation/general
*/

//NOTE Template UI

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //NOTE Methods

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: StandardMargin(
          horizontal: 15,
          vertical: 15,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  Column(
                    children: [
                      const Header(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .05,
                      ),
                      Column(
                        children: [
                          CustomTextField(
                            'Username',
                            formKey: uKey,
                            controller: usernameController,
                            // validator: (val) => passwordValidator(val),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            'Email',
                            formKey: emailKey,
                            controller: emailController,
                            validator: (val) => emailValidator(val),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            'Password',
                            formKey: passwordKey,
                            controller: passwordController,
                            obscureText: true,
                            validator: (val) => passwordValidator(val),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            'Facebook (Optional)',
                            formKey: fbKey,
                            controller: fbController,
                            obscureText: true,
                            validator: (val) => passwordValidator(val),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: CustomText(
                              'Forgot Password',
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          BtnFilled(
                            onTap: () async {
                              //Push Register
                              bool proceed = uKey.currentState!.validate() &&
                                  emailKey.currentState!.validate() &&
                                  passwordKey.currentState!.validate();

                              if (proceed) {
                                context.read<AuthenticationProvider>().register(
                                    context,
                                    UserRegister(
                                        fb: fbController.text,
                                        u: usernameController.text,
                                        email: emailController.text,
                                        password: passwordController.text));
                              }
                            },
                            text:
                                context.watch<AuthenticationProvider>().loading
                                    ? 'Creating Account . . .'
                                    : 'Register',
                            width: double.infinity,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Footer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//NOTE Components

/// [Footer]
class Footer extends StatelessWidget {
  const Footer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Wrap(
          spacing: 2,
          runSpacing: 2,
          children: [
            const CustomText(
              'Already have account?',
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const CustomText(
                'Login',
                color: Colors.blue,
              ),
            ),
          ],
        ),
        // const SizedBox(
        //   height: 50,
        // ),
        // const CustomText(
        //     'make a type specimen book. It has survived not only five centuries.',
        //     textAlign: TextAlign.center,
        //     type: Type.overline),
      ],
    );
  }
}

/// [Header]
class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .2,
          width: MediaQuery.of(context).size.width * .5,
          child: Stack(
            children: const [
              Placeholder(
                color: Colors.grey,
              ),
              Center(
                child: CustomText(
                  'LOGO',
                  size: 36,
                  weight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const CustomText('Lorem Ipsum', type: Type.headline6),
        const SizedBox(
          height: 5,
        ),
        const CustomText(
            'make a type specimen book. It has survived not only five centuries.',
            textAlign: TextAlign.center,
            type: Type.body2),
      ],
    );
  }
}
