import 'package:general/widgets/text.dart';

import 'controller/pages_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/drawer/component/drawer.dart';
import 'main.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: key,
        drawer: ComponentDrawer(context),
        appBar: AppBar(
            title: const CustomText(
          'Customize Component',
        )),
        body: context.watch<PagesController>().currentPage);
  }
}
