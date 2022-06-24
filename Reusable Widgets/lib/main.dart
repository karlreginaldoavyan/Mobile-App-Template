import 'controller/pages_controller.dart';
import 'package:flutter/material.dart';
import 'package:general/general.dart';
import 'package:provider/provider.dart';

import 'csv_export.dart';

//! Required
void main() {
  runApp(const MyApp());
}

var officialTheme = latoTextTheme;
var primaryColor = Colors.red;
final key = GlobalKey<ScaffoldState>();

//! Required
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
            fillColor: primaryColor,
            iconColor: primaryColor,
            focusColor: primaryColor),
        iconTheme: const IconThemeData(size: 18),
        brightness: Brightness.light,
        progressIndicatorTheme:
            ProgressIndicatorThemeData(color: Theme.of(context).primaryColor),
        appBarTheme: AppBarTheme(
            color: primaryColor,
            toolbarTextStyle: officialTheme.bodyText2,
            titleTextStyle: officialTheme.headline6),
        primaryColor: primaryColor,
        indicatorColor: primaryColor,
        primaryTextTheme: officialTheme,
        textTheme: officialTheme,
      ),
      home: ChangeNotifierProvider(
        child: GestureDetector(
          child: const CsvExportScreen(),
          onPanUpdate: (details) {
            // Swiping in right direction.
            if (details.delta.dx > 0) {
              print('Swiping to right : ${details.delta.dx}');
              key.currentState!.openDrawer();
            }

            // Swiping in left direction.
            if (details.delta.dx < 0) {
              print('Swiping to left : ${details.delta.dx}');
            }
          },
        ),
        create: (_) => PagesController(),
      ),
      // home: const MyHomePage(title: 'Headline'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: StandardPadding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                  'Custom Typography',
                  type: Type.headline6,
                  color: Colors.grey,
                  weight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomText('Normal'),
                const CustomCodeText('Code '),
                const CustomText(
                  'Headline 5',
                  type: Type.headline5,
                ),
                const CustomText(
                  'Headline 6',
                  type: Type.headline6,
                ),
                const CustomText(
                  'Subtitle 2',
                  type: Type.subtitle2,
                ),
                const CustomText(
                  'Subtitle 1',
                ),
                const CustomText(
                  'Overline',
                  type: Type.overline,
                ),
                const CustomText(
                  'Body 1',
                  type: Type.body1,
                ),
                const CustomText(
                  'Body 2',
                  type: Type.body2,
                ),
                const CustomBtnText('Button Text'),
                const Divider(),
                const CustomText(
                  'Custom Buttons',
                  color: Colors.grey,
                  type: Type.headline6,
                  weight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 10,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     BtnBorder(
                //       radius: 30,
                //       horizontal: 10,
                //       vertical: 8,
                //       icon: Iconify(
                //         Mdi.progress_close,
                //         color: error,
                //       ),
                //       color: error,
                //       onTap: () {},
                //       text: 'Reject',
                //     ),
                //     BtnBorder(
                //       width: 10,
                //       radius: 30,
                //       horizontal: 10,
                //       vertical: 8,
                //       icon: Iconify(
                //         Mdi.progress_clock,
                //         color: warning,
                //       ),
                //       color: warning,
                //       onTap: () {},
                //       text: 'Hold',
                //     ),
                //     BtnBorder(
                //       horizontal: 10,
                //       vertical: 8,
                //       radius: 30,
                //       icon: Iconify(
                //         Mdi.progress_check,
                //         color: success,
                //       ),
                //       color: success,
                //       onTap: () {},
                //       text: 'Done',
                //     ),
                //   ],
                // ),
                BtnFilled(
                  radius: 8,
                  onTap: () {
                    setState(() {
                      loading = !loading;
                    });
                  },
                  text: loading ? 'Loading' : 'Filled Button',
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
                            color: primaryColor,
                          ),
                        )
                      : const Icon(
                          Icons.wifi,
                        ),
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
                            color: primaryColor,
                          ),
                        )
                      : Icon(
                          Icons.wifi,
                          color: Theme.of(context).primaryColor,
                        ),
                ),
                // const Divider(),
                // const CustomText(
                //   'Custom Loading',
                //   color: Colors.grey,
                //   type: Type.headline6,
                //   weight: FontWeight.bold,
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                // CircularProgressIndicator(
                //   color: primaryColor,
                // ),
                // RefreshProgressIndicator(
                //   color: primaryColor,
                // ),
                // LinearProgressIndicator(
                //   color: primaryColor,
                // ),
                const Divider(),

                const Divider(),
                const CustomText(
                  'Custom Banner',
                  color: Colors.grey,
                  type: Type.headline6,
                  weight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context).splashColor,
                  ),
                  child: StandardPadding(
                    vertical: 15,
                    horizontal: 25,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomText(
                            'You can make an announcement!',
                            type: Type.headline6,
                            weight: FontWeight.w900,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const CustomText(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In porttitor euismod aliquet. Curabitur id mi luctus, pulvinar metus vel, sollicitudin turpis. Nunc in nulla felis. Quisque et imperdiet sem. Maecenas sed nulla nec enim euismod interdum in non quam. Nulla eleifend pellentesque mauris, sit amet iaculis turpis consectetur a. ',
                            type: Type.caption,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          BtnFilled(
                            onTap: () {},
                            radius: 8,
                            isReverse: true,
                            text: 'Announce Now!',
                            icon: const Icon(Icons.chevron_right),
                          )
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
