import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'data_json.dart';
import 'drawer.dart';
import 'cmn.dart';
import 'main.dart';

class Sedetails extends StatefulWidget {
  final regno;
  Sedetails({required this.regno});
  @override
  _SedetailsState createState() => _SedetailsState(regno: regno);
}

class _SedetailsState extends State<Sedetails> {
  String regno;
  _SedetailsState({required this.regno});

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
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () async {
                        Uri url = url_create.uri_cr("seeprofile.php");
                        var data = {
                          'reg_no': regno,
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
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: Expanded(
                    child: Card(
                      elevation: 5,
                      child: Center(
                        child: Text(
                          "Name: $name",
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: Expanded(
                    child: Card(
                      elevation: 5,
                      child: Center(
                        child: Text("Roll number: $roll"),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: Expanded(
                    child: Card(
                      elevation: 5,
                      child: Center(
                        child: Text("Semester: $sem"),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: Expanded(
                    child: Card(
                      elevation: 5,
                      child: Center(
                        child: Text("College: $college"),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: Expanded(
                    child: Card(
                      elevation: 5,
                      child: Center(
                        child: Text("hod: $hod"),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: Expanded(
                    child: Card(
                      elevation: 5,
                      child: Center(
                        child: Text("Department name: $deptname"),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: Expanded(
                    child: Card(
                      elevation: 5,
                      child: Center(
                        child: Text("district: $district"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
