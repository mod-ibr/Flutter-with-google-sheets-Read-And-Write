
function doGet(request) {


  saveStudentData(request);
  var result = getStudentData();
  return result;

}


function saveStudentData(request) {
  var sheet = SpreadsheetApp.openById("17H08WQISmGqsmy6hPYPmFBGN8CF1GsBM5m9wtXAy4JM");

  var result = { 'status': true };

  try {
    var student_id = request.parameter.student_id;
    var student_first_name = request.parameter.student_first_name;
    var student_last_name = request.parameter.student_last_name;
    var course_name = request.parameter.course_name;
    var duration = request.parameter.duration;

    var rowData = sheet.appendRow([student_id, student_first_name, student_last_name, course_name, duration]);

  }
  catch (exc) {
    result = { 'status': true, 'message': exc };
  }

  return ContentService.createTextOutput(JSON.stringify(result)).setMimeType(ContentService.MimeType.JSON);

}

function getStudentData() {
  var sheet = SpreadsheetApp.openById("17H08WQISmGqsmy6hPYPmFBGN8CF1GsBM5m9wtXAy4JM");
  try {
    var values = sheet.getActiveSheet().getDataRange().getValues();
    var data = [];
    for (var i = 1; i < values.length; i++) {
      var row = values[i];
      var studentData = {};
      studentData['student_id'] = row[0];
      studentData['student_first_name'] = row[1];
      studentData['student_last_name'] = row[2];
      studentData['course_name'] = row[3];
      studentData['duration'] = row[4];


      data.push(studentData);
    }
  } catch (exc) {
    data = { 'status': true, 'message': exc };

  }
  return ContentService.createTextOutput(JSON.stringify(data)).setMimeType(ContentService.MimeType.JSON);

}
