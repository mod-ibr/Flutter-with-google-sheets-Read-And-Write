import 'package:flutter/material.dart';
import 'package:flutter_with_google_sheet/constants.dart';
import 'package:flutter_with_google_sheet/view/SaveStudentData.dart';
import 'package:flutter_with_google_sheet/view/getAllStudentData.dart';
import 'package:flutter_with_google_sheet/widget/customButton.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Educational Online Center'),
        centerTitle: true,
        backgroundColor: PRIMARYCOLOR,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  border: Border.all(width: 3, color: PRIMARYCOLOR),
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.asset(
                    'assets/images/coursesLogo.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.height * 0.4,
                child: CustomButton(
                  icon: const Icon(Icons.save),
                  onpressed: () => Get.offAll((() => SaveStudentData())),
                  text: 'Add Student Data',
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.height * 0.4,
                child: CustomButton(
                  icon: const Icon(Icons.list),
                  onpressed: () => Get.offAll((() => GetAllStudentData())),
                  text: 'Show All Students Data',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
