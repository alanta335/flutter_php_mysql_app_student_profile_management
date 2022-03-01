import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'cmn.dart';
import 'drawer.dart';

class Attendance extends StatefulWidget {
  const Attendance({Key? key}) : super(key: key);

  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  TextEditingController regnocontroller = TextEditingController();
  String b = "";

  // ignore: non_constant_identifier_names
  TextEditingController p_or_a_controller = TextEditingController();
  TextEditingController nocontroller = TextEditingController();
  String a = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CmnDrawer(),
      appBar: AppBar(
        title: const Text("details"),
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: regnocontroller,
                    decoration: const InputDecoration(
                      hintText: 'enter here registration no',
                      labelText: 'registeration no',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: p_or_a_controller,
                    decoration: const InputDecoration(
                      hintText: 'enter here p for present and a for absent',
                      labelText: 'present or absent today',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      Uri url = url_create.uri_cr("attendance.php");
                      var data = {
                        'regno': regnocontroller.text,
                        'attendance': p_or_a_controller.text,
                      };
                      var res = await http.post(url, body: data);
                      // ignore: avoid_print
                      print(jsonDecode(res.body));
                      var s = jsonDecode(res.body);
                      setState(() {
                        a = s.toString();
                      });
                    },
                    child: const Text("Edit")),
                Text("$a"),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: nocontroller,
                    decoration: const InputDecoration(
                      hintText: 'enter the day in the format yyyy-mm-dd',
                      labelText: 'date',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    Uri url = url_create.uri_cr("attendance.php");
                    var data = {
                      'regno': regnocontroller.text,
                      'date': nocontroller.text,
                    };
                    var res = await http.post(url, body: data);
                    // ignore: avoid_print
                    print(jsonDecode(res.body));
                    var s = jsonDecode(res.body);
                    setState(() {
                      b = s.toString();
                    });
                  },
                  child: const Text("see attendance"),
                ),
                Text("$b"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
