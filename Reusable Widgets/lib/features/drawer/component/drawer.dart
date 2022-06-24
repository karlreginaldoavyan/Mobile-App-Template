import 'package:customization/controller/pages_controller.dart';
import 'package:customization/features/drawer/model/drawer.dart';
import 'package:flutter/material.dart';
import 'package:general/general.dart';
import 'package:provider/provider.dart';

import '../data/drawer.dart';

class ComponentDrawer extends StatefulWidget {
  const ComponentDrawer(
    this.context, {
    Key? key,
  }) : super(key: key);
  final BuildContext context;
  @override
  State<ComponentDrawer> createState() => _ComponentDrawerState();
}

class _ComponentDrawerState extends State<ComponentDrawer> {
  @override
  Widget build(BuildContext context) {
    print('Pages Before ${pages.length}');
    List<ModelDrawer> filteredPages = pages.toSet().toList();
    print('Pages After ${pages.length}');
    return Drawer(
        child: Column(
      children: [
        DrawerHeader(
          margin: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                  'https://avyanwebsite.herokuapp.com/images/avyan-full-blk1.png')
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
                children: filteredPages.map(
              (e) {
                List<ModelDrawer> grouped =
                    pages.where((element) => element.label == e.label).toList();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: CustomText(e.label,
                          type: Type.body2, color: Colors.grey),
                    ),
                    ...grouped.map((e) => ListTile(
                          trailing: const Icon(
                            Icons.chevron_right,
                            color: Colors.white,
                          ),
                          onTap: () {
                            context.read<PagesController>().changePage(e.child);
                            Navigator.pop(context);
                          },
                          title: CustomText(e.title),
                        ))
                  ],
                );
              },
            ).toList()),
          ),
        ),
      ],
    ));
  }
}
