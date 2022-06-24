import 'package:flutter/material.dart';
import 'package:general/general.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({Key? key}) : super(key: key);

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const CustomText(
          'Custom Switch',
          color: Colors.grey,
          type: Type.headline6,
          weight: FontWeight.bold,
        ),
        const SizedBox(
          height: 10,
        ),
        Switch(
          
            value: !isOn,
            onChanged: (val) {
              setState(() {
                isOn = !val;
              });
            }),
        SwitchListTile(
            title: const CustomText(
              'Notification',
            ),
            value: isOn,
            subtitle: const CustomText('On your notification'),
            onChanged: (val) {
              setState(() {
                isOn = val;
              });
            }),
        Switch.adaptive(
            value: isOn,
            onChanged: (val) {
              setState(() {
                isOn = val;
              });
            })
      ]),
    );
  }
}
