import 'dart:convert';
import 'main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'cmn.dart';
import 'data_json.dart';
import 'drawer.dart';

class SeMark extends StatefulWidget {
  const SeMark({Key? key}) : super(key: key);

  @override
  _SeMarkState createState() => _SeMarkState();
}

class _SeMarkState extends State<SeMark> {
  String s1 = "", s2 = "", s3 = "", s4 = "", s5 = "", s6 = "", s7 = "", s8 = "";
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
                      Uri url = url_create.uri_cr("seemark.php");
                      var data = {
                        'reg_no': regno,
                      };
                      var res = await http.post(url, body: data);
                      // ignore: avoid_print
                      print(jsonDecode(res.body));
                      var s = jsonDecode(res.body);
                      setState(() {
                        s1 = s[0]["s1"];
                        s3 = s[0]["s2"];
                        s2 = s[0]["s3"];
                        s4 = s[0]["s4"];
                        s5 = s[0]["s5"];
                        s6 = s[0]["s6"];
                        s7 = s[0]["s7"];
                        s8 = s[0]["s8"];
                      });
                    },
                    child: const Text("search")),
                Text("s1: $s1"),
                Text("s2: $s2"),
                Text("s3: $s3"),
                Text("s4: $s4"),
                Text("s5: $s5"),
                Text("s6: $s6"),
                Text("s7: $s7"),
                Text("s8: $s8"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
