import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_with_google_sheet/constants.dart';
import 'package:flutter_with_google_sheet/control/controller.dart';
import 'package:flutter_with_google_sheet/model/studentModel.dart';
import 'package:flutter_with_google_sheet/view/homePage.dart';
import 'package:get/get.dart';

class GetAllStudentData extends StatelessWidget {
  GetAllStudentData({super.key});
  StudentController controller = Get.put(StudentController());
  List allStudentData = [];

  DataRow _getDataRow(int index, StudentModel data) {
    return DataRow(
      cells: <DataCell>[
        DataCell(Text(
          '${data.student_id}',
        )),
        DataCell(Text('${data.student_first_name}')),
        DataCell(Text('${data.student_last_name}')),
        DataCell(Text('${data.course_name}')),
        DataCell(Text('${data.duration}')),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Save Student Data"),
        centerTitle: true,
        backgroundColor: PRIMARYCOLOR,
        leading: IconButton(
            onPressed: () => Get.offAll(() => const HomePage()),
            icon: const Icon(Icons.home)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
        child: GetBuilder<StudentController>(
          builder: (controller) => Padding(
            padding: const EdgeInsets.all(10),
            child: FutureBuilder<List<StudentModel>>(
              future: controller.getStudentData(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<StudentModel>> snapshot) {
                if (snapshot.hasData) {
                  allStudentData = snapshot.data!;
                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: const [
                          DataColumn(
                              label: Text('ID',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red))),
                          DataColumn(
                              label: Text('First Name',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red))),
                          DataColumn(
                              label: Text('Last Name',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red))),
                          DataColumn(
                              label: Text('Course Name',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red))),
                          DataColumn(
                              label: Text('Duration',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red))),
                        ],
                        rows: List.generate(
                          allStudentData.length,
                          (index) => _getDataRow(
                            index,
                            allStudentData[index],
                          ),
                        ),
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return const Center(child: Text('No Data'));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
