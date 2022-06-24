import 'package:flutter/material.dart';
import 'package:general/general.dart';

class DividerScreen extends StatefulWidget {
  const DividerScreen({Key? key}) : super(key: key);

  @override
  State<DividerScreen> createState() => _DividerScreenState();
}

class _DividerScreenState extends State<DividerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
        CustomText(
          'Custom Divider',
          color: Colors.grey,
          type: Type.headline6,
          weight: FontWeight.bold,
        ),
        SizedBox(
          height: 10,
        ),
        HDivider(),
        SizedBox(
          height: 5,
        ),
        VDivider()
      ]),
    );
  }
}

// Copy this code to the general packages


