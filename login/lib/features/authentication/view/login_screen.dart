import 'package:flutter/material.dart';
import 'package:general/general.dart';
import 'package:login/features/authentication/provider/authentication_provider.dart';
import 'package:login/features/authentication/view/register_screen.dart';
import 'package:provider/provider.dart';

import '../core/utils/form_key/login_key.dart';
import '../core/utils/text_editing_controller/login_text_controller.dart';
import '../model/input/user_login.dart';

/// The [LoginScreen] function list:
/// - LoginButton [connect to api and expect a response]
///*  if Success
///*    - The Screen will redirect to MainScreen (Protected)
/// !  if Error
/// !    - The Screen will stay to LoginScreen
/// !    - Will Pop up an error message
/// Required Dependencies:
/* 
general:
    git:
      url: https://github.com/FlutterStation/general
*/

//NOTE Template UI

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                            'Email',
                            formKey: emailKey,
                            controller: emailController,
                            keyboard: TextInputType.emailAddress,
                            validator: (val) => emailValidator(val),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            'Password',
                            suffix: IconButton(
                              icon: Icon(context
                                      .watch<AuthenticationProvider>()
                                      .password
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () => context
                                  .read<AuthenticationProvider>()
                                  .showPassword(),
                            ),
                            formKey: passwordKey,
                            controller: passwordController,
                            obscureText: context
                                .watch<AuthenticationProvider>()
                                .password,
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
                            isExpand: true,
                            width: double.infinity,
                            onTap: () async {
                              //Push Login

                              bool proceed =
                                  emailKey.currentState!.validate() &&
                                      passwordKey.currentState!.validate();

                              print(proceed);
                              if (proceed) {
                                context.read<AuthenticationProvider>().login(
                                    context,
                                    UserLogin(
                                        email: emailController.text,
                                        password: passwordController.text));
                              }
                            },
                            text:
                                context.watch<AuthenticationProvider>().loading
                                    ? 'Logging In . . .'
                                    : 'Login',
                          ),
                        ],
                      )
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
              'Don\'t have account yet?',
            ),
            GestureDetector(
              onTap: () {
                //! Used pushNamed and set routing in main.dart for better routing
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => ChangeNotifierProvider.value(
                              value: context.read<AuthenticationProvider>(),
                              child: const RegisterScreen(),
                            )));
              },
              child: const CustomText(
                'Create Account',
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
