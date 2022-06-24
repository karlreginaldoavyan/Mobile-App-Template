import 'package:flutter/material.dart';
import 'package:general/general.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const CustomText(
          'Custom Loading',
          color: Colors.grey,
          type: Type.headline6,
          weight: FontWeight.bold,
        ),
        const SizedBox(
          height: 10,
        ),
        CircularProgressIndicator(
          color: Theme.of(context).primaryColor,
        ),
        const SizedBox(
          height: 5,
        ),
        RefreshProgressIndicator(
          color: Theme.of(context).primaryColor,
        ),
        const SizedBox(
          height: 5,
        ),
        LinearProgressIndicator(
          color: Theme.of(context).primaryColor,
        ),
      ]),
    );
  }
}
