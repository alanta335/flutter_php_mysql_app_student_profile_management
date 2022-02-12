class Student {
  Student({required this.name, required this.rollno});
  final String name;
  final String rollno;
  factory Student.fromJson(Map<String, dynamic> data) {
    // note the explicit cast to String
    // this is required if robust lint rules are enabled
    final name = data['name'] as String;
    final rollno = data['roll'] as String;
    return Student(name: name, rollno: rollno);
  }
}
