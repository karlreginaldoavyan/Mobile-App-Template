import 'package:flutter/material.dart';
import 'package:general/general.dart';

class ButtonScreen extends StatefulWidget {
  const ButtonScreen({Key? key}) : super(key: key);

  @override
  State<ButtonScreen> createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const CustomText(
          'Custom Buttons',
          color: Colors.grey,
          type: Type.headline6,
          weight: FontWeight.bold,
        ),
        const SizedBox(
          height: 10,
        ),
        BtnFilled(
          radius: 8,
          onTap: () {
            setState(() {
              loading = !loading;
            });
          },
          text: loading ? 'Loading' : 'Filled Button',
        ),
        const SizedBox(
          height: 5,
        ),
        BtnTextOnly(
          radius: 8,
          onTap: () {
            setState(() {
              loading = !loading;
            });
          },
          text: loading ? 'Loading' : 'Text Only Button',
        ),
        const SizedBox(
          height: 5,
        ),
        BtnBorder(
          radius: 8,
          onTap: () {
            setState(() {
              loading = !loading;
            });
          },
          text: loading ? 'Loading' : 'Border Button',
        ),
        const Divider(),
        BtnFilled(
          radius: 8,
          onTap: () {
            setState(() {
              loading = !loading;
            });
          },
          text: loading ? 'Loading' : 'Filled Button',
          icon: loading
              ? const SizedBox(
                  height: 18,
                  width: 18,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : const Icon(
                  Icons.wifi,
                ),
        ),
        const SizedBox(
          height: 5,
        ),
        BtnTextOnly(
          radius: 8,
          onTap: () {
            setState(() {
              loading = !loading;
            });
          },
          text: loading ? 'Loading' : 'Text Only Button',
          icon: loading
              ? SizedBox(
                  height: 18,
                  width: 18,
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                )
              : const Icon(
                  Icons.wifi,
                ),
        ),
        const SizedBox(
          height: 5,
        ),
        BtnBorder(
          radius: 8,
          onTap: () {
            setState(() {
              loading = !loading;
            });
          },
          text: loading ? 'Loading' : 'Border Button',
          icon: loading
              ? SizedBox(
                  height: 18,
                  width: 18,
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                )
              : Icon(
                  Icons.wifi,
                  color: Theme.of(context).primaryColor,
                ),
        ),
      ]),
    );
  }
}
