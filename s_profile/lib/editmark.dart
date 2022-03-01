import 'dart:convert';

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
  TextEditingController regnocontroller = TextEditingController();
  TextEditingController semcontroller = TextEditingController();
  TextEditingController semmarkcontroller = TextEditingController();
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
                      labelText: 'registration no',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: semcontroller,
                    decoration: const InputDecoration(
                      hintText: 'enter here semester no  eg s1 or s2 or s3 etx',
                      labelText: 'sem no',
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
                ElevatedButton(
                    onPressed: () async {
                      Uri url = url_create.uri_cr("editmark.php");
                      var data = {
                        'reg_no': regnocontroller.text,
                        'sem': semcontroller.text,
                        'mark': semmarkcontroller.text,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
