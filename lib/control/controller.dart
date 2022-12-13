import 'dart:convert' as convert;
import 'package:flutter/foundation.dart';
import 'package:flutter_with_google_sheet/model/studentModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class StudentController extends GetxController {
  String? studentId, firstName, lastName, courseName, duration;
  bool isLoading = true;
  // Google App Script Web URL
  final String url =
      "https://script.google.com/macros/s/AKfycbzOzHHi5lLF-rpgV1g67GLVRXP-Z70f5hZPU0DkSx8pt4EPMrWAz_xhDgjA-86wzWa1kw/exec";

  final isStatusSuccess = true;

// here we use toQueryStringParams
  void saveStudentData() async {
    StudentModel studentModel = StudentModel(
        student_id: studentId,
        student_first_name: firstName,
        course_name: courseName,
        student_last_name: lastName,
        duration: duration);
    try {
      var response =
          await http.get(Uri.parse(url + studentModel.toQueryStringParams()));

      var responseStatus = convert.jsonDecode(response.body)['status'];

      if (responseStatus == isStatusSuccess) {
        Get.snackbar('Done', "Student Data Saved");
      } else {
        Get.snackbar('Error', "Can't Save Student Data");
      }

      if (kDebugMode) {
        print(
            '###################################### STATUS : $responseStatus');
      }
    } catch (e) {
      Get.snackbar('Error', "$e");

      if (kDebugMode) {
        print(e);
      }
    }
    update();
  }

  Future<List<StudentModel>> getStudentData() async {
    isLoading = true;
    try {
      var response = await http.get(Uri.parse(url));

      List<dynamic> responseBody = convert.jsonDecode(response.body);

      List<StudentModel> allStudentData = responseBody
          .map(
            (studentData) => StudentModel.fromJson(studentData),
          )
          .toList();

      return allStudentData;
    } catch (e) {
      Get.snackbar('Error', "$e");

      if (kDebugMode) {
        print(e);
      }
    }
    isLoading = false;
    update();
    return [];
  }
}
