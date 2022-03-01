import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'drawer.dart';
import 'cmn.dart';
class Mark extends StatefulWidget {
  const Mark({Key? key}) : super(key: key);

  @override
  _MarkState createState() => _MarkState();
}

class _MarkState extends State<Mark> {
  TextEditingController s1controller = TextEditingController();
  TextEditingController s2controller = TextEditingController();
  TextEditingController s3controller = TextEditingController();
  TextEditingController s4controller = TextEditingController();
  TextEditingController s5controller = TextEditingController();
  TextEditingController s6controller = TextEditingController();
  TextEditingController s7controller = TextEditingController();
  TextEditingController s8controller = TextEditingController();
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
                    controller: s1controller,
                    decoration: const InputDecoration(
                      hintText: 'enter here s1 mark',
                      labelText: 's1',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: s2controller,
                    decoration: const InputDecoration(
                      hintText: 'enter here s2 mark',
                      labelText: 's2',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: s3controller,
                    decoration: const InputDecoration(
                      hintText: 'enter here s3 mark',
                      labelText: 's3',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: s4controller,
                    decoration: const InputDecoration(
                      hintText: 'enter here s4 mark',
                      labelText: 's4',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: s4controller,
                    decoration: const InputDecoration(
                      hintText: 'enter here s4 mark',
                      labelText: 's4',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: s5controller,
                    decoration: const InputDecoration(
                      hintText: 'enter here s5 mark',
                      labelText: 's5',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: s6controller,
                    decoration: const InputDecoration(
                      hintText: 'enter here s6 mark',
                      labelText: 's6',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: s7controller,
                    decoration: const InputDecoration(
                      hintText: 'enter here s7 mark',
                      labelText: 's7',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: s8controller,
                    decoration: const InputDecoration(
                      hintText: 'enter here s8 mark',
                      labelText: 's8',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                    Uri url = url_create.uri_cr("f.php");
                      var data = {
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
                      // ignore: avoid_print
                      print(jsonDecode(res.body));
                      var s = jsonDecode(res.body);
                      setState(() {
                        String a = url.toString();
                      });
                    },
                    child: const Text("search")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
