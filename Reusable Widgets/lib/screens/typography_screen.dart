import 'package:flutter/material.dart';
import 'package:general/general.dart';

class TypographyScreen extends StatefulWidget {
  const TypographyScreen({Key? key}) : super(key: key);

  @override
  State<TypographyScreen> createState() => _TypographyScreenState();
}

class _TypographyScreenState extends State<TypographyScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
        CustomText(
          'Custom Typography',
          color: Colors.grey,
          type: Type.headline6,
          weight: FontWeight.bold,
        ),
        SizedBox(
          height: 10,
        ),
        CustomText('Normal'),
        SizedBox(
          height: 5,
        ),
        CustomCodeText('Code '),
        SizedBox(
          height: 5,
        ),
        CustomText(
          'Headline 5',
          type: Type.headline5,
        ),
        SizedBox(
          height: 5,
        ),
        CustomText(
          'Headline 6',
          type: Type.headline6,
        ),
        SizedBox(
          height: 5,
        ),
        CustomText(
          'Subtitle 2',
          type: Type.subtitle2,
        ),
        SizedBox(
          height: 5,
        ),
        CustomText(
          'Subtitle 1',
        ),
        SizedBox(
          height: 5,
        ),
        CustomText(
          'Overline',
          type: Type.overline,
        ),
        SizedBox(
          height: 5,
        ),
        CustomText(
          'Body 1',
          type: Type.body1,
        ),
        SizedBox(
          height: 5,
        ),
        CustomText(
          'Body 2',
          type: Type.body2,
        ),
      ]),
    );
  }
}
