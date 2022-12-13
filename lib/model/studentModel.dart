class StudentModel {
  String? student_id,
      student_first_name,
      student_last_name,
      course_name,
      duration;

  StudentModel(
      {required this.student_id,
      required this.student_first_name,
      required this.course_name,
      required this.student_last_name,
      required this.duration});

  // Method to make GET parameters.
  String toQueryStringParams() =>
      "?student_id=$student_id&student_first_name=$student_first_name&student_last_name=$student_last_name&course_name=$course_name&duration=$duration";

// We can use any one of  toJson or toQueryStringParams.
// toQueryStringParams is more easy but fixed in use, toJson is more customized when ther is need to pass other values as params.
  Map<String, String> toJson() {
    return {
      'student_id': student_id!,
      'student_first_name': student_first_name!,
      'student_last_name': student_last_name!,
      'course_name': course_name!,
      'duration': duration!
    };
  }

  StudentModel.fromJson(Map<String, dynamic> map) {
    student_id = map['student_id'].toString();
    student_first_name = map['student_first_name'].toString();
    student_last_name = map['student_last_name'].toString();
    course_name = map['course_name'].toString();
    duration = map['duration'].toString();
  }
}
