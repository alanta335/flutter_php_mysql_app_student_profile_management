import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'drawer.dart';

class Sedetails extends StatefulWidget {
  const Sedetails({Key? key}) : super(key: key);

  @override
  _SedetailsState createState() => _SedetailsState();
}

class _SedetailsState extends State<Sedetails> {
  TextEditingController regnocontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const CmnDrawer(),
        appBar: AppBar(
          title: const Text("details"),
        ),
        body: Center(
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
                      'roll': regnocontroller.text,
                    };
                    var res = await http.post(url, body: data);
                    // ignore: avoid_print
                    print(jsonDecode(res.body));
                    setState(() {
                      String a = url.toString();
                    });
                  },
                  child: const Text("search")),
            ],
          ),
        ));
  }
}
