import 'package:flutter/material.dart';
import 'package:general/general.dart';

class CsvExportScreen extends StatefulWidget {
  const CsvExportScreen({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CsvExportScreen> {
  late List<List<dynamic>> employeeData;

  @override
  initState() {
    //create an element rows of type list of list. All the above data set are stored in associate list
//Let associate be a model class with attributes name,gender and age and associateList be a list of associate model class.

    employeeData = List<List<dynamic>>.empty(growable: true);

    for (int i = 0; i < 5; i++) {
//row refer to each column of a row in csv file and rows refer to each row in a file
      List<dynamic> row = List.empty(growable: true);
      row.add("Employee Name $i");
      row.add((i % 2 == 0) ? "Male" : "Female");
      row.add(" Experience : ${i * 5}");
      employeeData.add(row);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const CustomText("Flutter CSV Upload"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.green,
                height: 30,
                child: TextButton(
                  child: const CustomText(
                    "Export to CSV",
                    color: Colors.white,
                  ),
                  onPressed: () async {
                    await CsvExport.getCsv(employeeData);
                  },
                ),
              ),
            ),
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
