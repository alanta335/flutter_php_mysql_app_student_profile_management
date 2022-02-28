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
  String regno = "";
  String depNo = "";
  String sem = "";
  String roll = "";
  String college = "", deptname = "", hod = "", district = "", address = "";
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
                      hintText: 'enter here roll no',
                      labelText: 'roll no',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      Uri url = Uri(
                          scheme: "http",
                          host: '192.168.81.212',
                          path: '/flutter/f.php');
                      var data = {
                        'reg_no': regnocontroller.text,
                      };
                      var res = await http.post(url, body: data);
                      // ignore: avoid_print
                      print(jsonDecode(res.body));
                      var s = jsonDecode(res.body);
                      setState(() {
                        name = s[0]["name"];
                        roll = s[0]["roll"];
                        regno = "WIP";
                        depNo = "WIP";
                        sem = "WIP";
                        college = "WIP";
                        deptname = "WIP";
                        hod = "WIP";
                        district = "WIP";
                        address = "WIP";
                      });
                    },
                    child: const Text("search")),
                Text("Name: $name"),
                Text("Roll number: $roll"),
                Text("Register number: $regno"),
                Text("Department: $depNo"),
                Text("Semester: $sem"),
                Text("College: $college"),
                Text("hod: $hod"),
                Text("Department name: $deptname"),
                Text("district: $district"),
                Text("Full address: $address"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
