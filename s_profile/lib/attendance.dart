import 'dart:convert';
import 'package:http/http.dart' as http;
import 'main.dart';
import 'package:flutter/material.dart';
import 'cmn.dart';
import 'drawer.dart';

class Attendance extends StatefulWidget {
  const Attendance({Key? key}) : super(key: key);

  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
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
                ElevatedButton(
                  onPressed: () async {
                    Uri url = url_create.uri_cr("seeattendance.php");
                    var data = {
                      'reg_no': regno,
                    };
                    var res = await http.post(url, body: data);
                    // ignore: avoid_print
                    print(jsonDecode(res.body));
                    var s = jsonDecode(res.body);
                    setState(() {
                      b = s[0]['pre'];
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
