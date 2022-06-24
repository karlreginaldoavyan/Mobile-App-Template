import 'package:flutter/material.dart';
import 'package:general/general.dart';

class CsvImportScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CsvImportScreenState();
  }
}

class CsvImportScreenState extends State<CsvImportScreen> {
  late List<List<dynamic>> employeeData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    employeeData = List<List<dynamic>>.empty(growable: true);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: const CustomText("CSV To List")),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.red,
                height: 30,
                child: TextButton(
                  child: const CustomText(
                    "CSV To List",
                    color: Colors.white,
                  ),
                  onPressed: () async {
                    employeeData = await CsvImport.openFileExplorer(mounted);

                    setState(() {});

                    print(employeeData.runtimeType);
                    print('Employee $employeeData');
                  },
                ),
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: employeeData.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(employeeData[index][0]),
                          CustomText(employeeData[index][1]),
                          CustomText(employeeData[index][2]),
                        ],
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
