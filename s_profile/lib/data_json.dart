// class Student {
//   Student();
//   final String name;
//   final String rollno;
//   factory Student.fromJson(Map<String, dynamic> data) {
//     note the explicit cast to String
//     // this is required if robust lint rules are enabled
//     final name = data[0]['name'] as String;
//     final rollno = data[0]['roll'] as String;
//     return Student();
//   }
// }
