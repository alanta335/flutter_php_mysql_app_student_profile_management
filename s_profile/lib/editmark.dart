import 'dart:convert';
import 'main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'cmn.dart';
import 'drawer.dart';

class EditMark extends StatefulWidget {
  const EditMark({Key? key}) : super(key: key);

  @override
  _EditMarkState createState() => _EditMarkState();
}

class _EditMarkState extends State<EditMark> {
  TextEditingController semcontroller = TextEditingController();
  TextEditingController semmarkcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();

  String a = "";
  var p = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CmnDrawer(),
      appBar: AppBar(
        title: Center(child: const Text("Update marks")),
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: semcontroller,
                    decoration: const InputDecoration(
                      hintText: 'Enter the semester to update',
                      labelText: 'Semester number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: semmarkcontroller,
                    decoration: const InputDecoration(
                      hintText: 'enter here mark',
                      labelText: 'Mark',
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
                      hintText: 'Enter administrator password',
                      labelText: 'Admin Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        p = passcontroller.text.toString();
                      });
                      if (p == "admin") {
                        setState(() {
                          a = "succeeded";
                        });
                        Uri url = url_create.uri_cr("editmark.php");
                        var data = {
                          'reg_no': regno,
                          'sem': "${semcontroller.text}_sgpa",
                          'mark': semmarkcontroller.text,
                        };
                        var res = await http.post(url, body: data);
                        // ignore: avoid_print
                        print(jsonDecode(res.body));
                        var s = jsonDecode(res.body);
                      } else {
                        setState(() {
                          a = "wrong password";
                        });
                      }
                    },
                    child: const Text("insert")),
                Text("$a"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
