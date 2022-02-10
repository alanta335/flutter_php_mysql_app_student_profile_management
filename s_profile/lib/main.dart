import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String a = "";

  void _incrementCounter() async {
    Uri url =
        Uri(scheme: "http", host: '192.168.81.212', path: '/flutter/f.php');
    var data = {
      'roll': rollcontroller.text,
      'name': namecontroller.text,
    };
    var res = await http.post(url, body: data);
    // ignore: avoid_print
    print(jsonDecode(res.body));
    setState(() {
      a = url.toString();
    });
  }

  TextEditingController rollcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: rollcontroller,
                    decoration: const InputDecoration(
                      hintText: 'enter here roll no',
                      labelText: 'roll no',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: namecontroller,
                    decoration: const InputDecoration(
                      hintText: 'enter here name',
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$a',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
