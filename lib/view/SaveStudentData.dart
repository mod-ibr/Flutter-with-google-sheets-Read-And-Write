import 'package:flutter/material.dart';
import 'package:flutter_with_google_sheet/constants.dart';
import 'package:flutter_with_google_sheet/control/controller.dart';
import 'package:flutter_with_google_sheet/view/homePage.dart';
import 'package:flutter_with_google_sheet/widget/customButton.dart';
import 'package:flutter_with_google_sheet/widget/customTextField.dart';
import 'package:get/get.dart';

class SaveStudentData extends StatelessWidget {
  SaveStudentData({super.key});
  StudentController controller = Get.put(StudentController());
  final _formKey = GlobalKey<FormState>();

  // TextField Controllers
  TextEditingController studentId = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController courseNameController = TextEditingController();
  TextEditingController durationController = TextEditingController();

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      controller.saveStudentData();
      Get.snackbar('Loading', "Saving Student Data");
      _clearTextField();
    }
  }

  void _clearTextField() {
    studentId.clear();
    firstNameController.clear();
    lastNameController.clear();
    courseNameController.clear();
    durationController.clear();
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
      body: GetBuilder<StudentController>(
        init: StudentController(),
        builder: (controller) => Center(
          child: Container(
            padding:
                const EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CustomTextField(
                          controller: studentId,
                          onSave: (value) => controller.studentId = value!,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Valid Id";
                            }
                          },
                          text: "Student ID",
                        ),
                        CustomTextField(
                          controller: firstNameController,
                          onSave: (value) => controller.firstName = value!,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Valid First Name";
                            }
                          },
                          text: "Student First Name",
                        ),
                        CustomTextField(
                          controller: lastNameController,
                          onSave: (value) => controller.lastName = value!,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Valid Last Name";
                            }
                            return null;
                          },
                          text: "Student Last Name",
                        ),
                        CustomTextField(
                          controller: courseNameController,
                          onSave: (value) => controller.courseName = value!,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Course Name";
                            }
                            return null;
                          },
                          text: "Course Name",
                        ),
                        CustomTextField(
                          controller: durationController,
                          onSave: (value) => controller.duration = value!,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Duration";
                            }
                            return null;
                          },
                          text: "Duration In Weeks",
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Center(
                          child: CustomButton(
                              icon: const Icon(Icons.save),
                              text: 'Save Student Data',
                              onpressed: _submitForm),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
