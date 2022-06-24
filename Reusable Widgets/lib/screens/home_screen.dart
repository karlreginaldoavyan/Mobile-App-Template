import '../features/drawer/data/drawer.dart';
import 'package:flutter/material.dart';
import 'package:general/general.dart';
import 'package:provider/provider.dart';

import '../controller/pages_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Wrap(
            runSpacing: 15,
            spacing: 15,
            alignment: WrapAlignment.center,
            children: pages
                .map((e) => InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () {
                        context.read<PagesController>().changePage(e.child);
                      },
                      child: Card(
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Theme.of(context).primaryColor,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                e.title,
                                overflow: TextOverflow.ellipsis,
                                type: Type.subtitle2,
                              ),
                              Wrap(
                                children: [
                                  CustomText(
                                    'Label: ${e.label}',
                                    type: Type.body2,
                                  ),
                                  const Icon(
                                    Icons.chevron_right,
                                  )
                                ],
                              ),
                            ],
                          ),
                          width: MediaQuery.of(context).size.width * .45,
                        ),
                      ),
                    ))
                .toList()),
      ),
    );
  }
}
