import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'drawer.dart';
import 'cmn.dart';
import 'main.dart';
import 'sedetails.dart';

class Mark extends StatefulWidget {
  const Mark({Key? key}) : super(key: key);

  @override
  _MarkState createState() => _MarkState();
}

class _MarkState extends State<Mark> {
  TextEditingController s1controller = TextEditingController()..text = '0.00';
  TextEditingController s2controller = TextEditingController()..text = '0.00';
  TextEditingController s3controller = TextEditingController()..text = '0.00';
  TextEditingController s4controller = TextEditingController()..text = '0.00';
  TextEditingController s5controller = TextEditingController()..text = '0.00';
  TextEditingController s6controller = TextEditingController()..text = '0.00';
  TextEditingController s7controller = TextEditingController()..text = '0.00';
  TextEditingController s8controller = TextEditingController()..text = '0.00';
  String a = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CmnDrawer(),
      appBar: AppBar(
        title: const Text("Enter your marks"),
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: s1controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter your S1 Mark',
                      labelText: 'S1',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: s2controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter your S2 Mark',
                      labelText: 'S2',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: s3controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter your S3 Mark',
                      labelText: 'S3',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: s4controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter your S4 Mark',
                      labelText: 'S4',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: s5controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter your S5 Mark',
                      labelText: 'S5',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: s6controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter your S6 Mark',
                      labelText: 'S6',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: s7controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter your S7 Mark',
                      labelText: 'S7',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: s8controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter your S8 Mark',
                      labelText: 'S8',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      Uri url = url_create.uri_cr("insert_mark.php");
                      var data = {
                        'reg_no': regno,
                        's1': s1controller.text,
                        's2': s2controller.text,
                        's3': s3controller.text,
                        's4': s4controller.text,
                        's5': s5controller.text,
                        's6': s6controller.text,
                        's7': s7controller.text,
                        's8': s8controller.text,
                      };
                      var res = await http.post(url, body: data);
                      // // ignore: avoid_print
                      // print(jsonDecode(res.body));
                      // var s = jsonDecode(res.body);
                      // setState(() {
                      //   a = s[0];
                      // });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Sedetails(regno: regno)),
                      );
                    },
                    child: Text("Insert and continue")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
