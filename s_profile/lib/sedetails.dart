import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'data_json.dart';
import 'drawer.dart';

class Sedetails extends StatefulWidget {
  const Sedetails({Key? key}) : super(key: key);
  @override
  _SedetailsState createState() => _SedetailsState();
}

class _SedetailsState extends State<Sedetails> {
  TextEditingController regnocontroller = TextEditingController();
  String name = "";
  String sem = "";
  String roll = "";
  String college = "", deptname = "", hod = "", district = "";
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
                      hintText: 'enter here reg no',
                      labelText: 'reg no',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      Uri url = Uri(
                          scheme: "http",
                          host: '192.168.195.212',
                          path: '/flutter/seeprofile.php');
                      var data = {
                        'reg_no': regnocontroller.text.toString(),
                      };

                      try {
                        var res = await http.post(url, body: data);
                        var s = jsonDecode(res.body);
                        print(jsonDecode(res.body));
                        setState(() {
                          name = s[0]['fname'] + ' ' + s[0]['lname'];
                          roll = s[0]['roll'];
                          sem = s[0]['sem'];
                          college = s[0]['col_name'];
                          deptname = s[0]['dep_name'];
                          hod = s[0]['hod'];
                          district = s[0]['district'];
                        });
                      } catch (exception) {
                        print(exception.toString());
                      }
                    },
                    child: const Text("search")),
                Text("Name: $name"),
                Text("Roll number: $roll"),
                Text("Semester: $sem"),
                Text("College: $college"),
                Text("hod: $hod"),
                Text("Department name: $deptname"),
                Text("district: $district"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
