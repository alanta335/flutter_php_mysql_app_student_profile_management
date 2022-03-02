import 'dart:convert';
import 'drawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'mark.dart';
import 'cmn.dart';
import 'login.dart';

String regno = "";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Startpage(),
    );
  }
}

class Startpage extends StatefulWidget {
  @override
  State<Startpage> createState() => _StartpageState();
}

class _StartpageState extends State<Startpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Student management"))),
      body: Container(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
                child: Text("  Log in  ")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(title: "Registration"),
                    ),
                  );
                },
                child: Text("Register"))
          ],
        ),
      )),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String a = "";

  void _incrementCounter() async {
    Uri url = url_create.uri_cr("insertprofile.php");
    print(url);
    var data = {
      'roll': rollcontroller.text,
      'fname': fnamecontroller.text,
      'lname': lnamecontroller.text,
      'regno': regnocontroller.text,
      'deptname': deptnamecontroller.text,
      'semester': semestercontroller.text,
      'pass': passcontroller.text,
      'collegeid': colnocontroller.text,
      'collegename': colnamecontroller.text,
      'district': distcontroller.text,
      'depno': deptnocontroller.text,
      'hod': hodcontroller.text,
      'attendance': attendanceC.text,
    };
    var res = await http.post(url, body: data);
    a = res.statusCode.toString();
    // ignore: avoid_print
    //var s = jsonDecode(res.body);
    //print(res.body['q1'] + "++++++++++");
    setState(() {
      regno = regnocontroller.text;
    });
    if (a == "200") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Mark()),
      );
    }
  }

  TextEditingController rollcontroller = TextEditingController();
  TextEditingController fnamecontroller = TextEditingController();
  TextEditingController lnamecontroller = TextEditingController();
  TextEditingController regnocontroller = TextEditingController();
  TextEditingController deptnamecontroller = TextEditingController();
  TextEditingController semestercontroller = TextEditingController();
  TextEditingController colnamecontroller = TextEditingController();
  TextEditingController colnocontroller = TextEditingController();
  TextEditingController distcontroller = TextEditingController();
  TextEditingController deptnocontroller = TextEditingController();
  TextEditingController hodcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  TextEditingController attendanceC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter Student Details"),
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: rollcontroller,
                        decoration: const InputDecoration(
                          hintText: 'Enter the Roll number',
                          labelText: 'Roll number',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: fnamecontroller,
                        decoration: const InputDecoration(
                          hintText: 'Enter the First name',
                          labelText: 'First Name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: lnamecontroller,
                        decoration: const InputDecoration(
                          hintText: 'Enter the Last name',
                          labelText: 'Last name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: regnocontroller,
                        decoration: const InputDecoration(
                          hintText: 'Enter the registration number',
                          labelText: 'Register Number',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        obscureText: true,
                        controller: passcontroller,
                        decoration: const InputDecoration(
                          hintText: 'Enter your password',
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: deptnamecontroller,
                        decoration: const InputDecoration(
                          hintText: 'Enter your department name',
                          labelText: 'Department Name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: deptnocontroller,
                        decoration: const InputDecoration(
                          hintText: 'Enter the department number',
                          labelText: 'Department number',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: semestercontroller,
                        decoration: const InputDecoration(
                          hintText: 'Semester:',
                          labelText: 'Semester number',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: attendanceC,
                        decoration: const InputDecoration(
                          hintText: 'Enter your current attendance',
                          labelText: 'Attendance percentage',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: colnamecontroller,
                        decoration: const InputDecoration(
                          hintText: 'Enter your college name',
                          labelText: 'College Name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: colnocontroller,
                        decoration: const InputDecoration(
                          hintText: 'Enter the college ID',
                          labelText: 'College ID',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: distcontroller,
                        decoration: const InputDecoration(
                          hintText: 'Enter your district',
                          labelText: 'District',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: hodcontroller,
                        decoration: const InputDecoration(
                          hintText: 'Enter your HOD name',
                          labelText: 'HOD Name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  '$a',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
