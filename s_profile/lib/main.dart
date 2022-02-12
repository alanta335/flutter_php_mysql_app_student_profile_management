import 'dart:convert';
import 'drawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'mark.dart';

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
    Uri url = Uri(
        scheme: "http", host: '192.168.81.212', path: '/flutter/insert.php');
    var data = {
      'roll': rollcontroller.text,
      'name': namecontroller.text,
      'regno': regnocontroller.text,
      'deptname': deptnamecontroller.text,
      'semester': semestercontroller.text,
      'collegeid': colnocontroller.text,
      'collegename': colnamecontroller.text,
      'district': distcontroller.text,
      'depno': deptnocontroller.text,
      'address': addresscontroller.text,
      'hod': hodcontroller.text,
    };
    var res = await http.post(url, body: data);
    // ignore: avoid_print
    print(jsonDecode(res.body));
    setState(() {
      a = res.statusCode.toString();
    });
    if (a == "200") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Mark()),
      );
    }
  }

  TextEditingController rollcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController regnocontroller = TextEditingController();
  TextEditingController deptnamecontroller = TextEditingController();
  TextEditingController semestercontroller = TextEditingController();
  TextEditingController colnamecontroller = TextEditingController();
  TextEditingController colnocontroller = TextEditingController();
  TextEditingController distcontroller = TextEditingController();
  TextEditingController deptnocontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController hodcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new CmnDrawer(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          Center(
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
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: regnocontroller,
                        decoration: const InputDecoration(
                          hintText: 'enter here register number',
                          labelText: 'Register no',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: deptnocontroller,
                        decoration: const InputDecoration(
                          hintText: 'enter here department number',
                          labelText: 'Department number',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: semestercontroller,
                        decoration: const InputDecoration(
                          hintText: 'enter here semester number',
                          labelText: 'Semester no',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: colnocontroller,
                        decoration: const InputDecoration(
                          hintText: 'enter here college id',
                          labelText: 'College id',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: colnamecontroller,
                        decoration: const InputDecoration(
                          hintText: 'enter here college name',
                          labelText: 'College name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: distcontroller,
                        decoration: const InputDecoration(
                          hintText: 'enter here district',
                          labelText: 'district',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: deptnamecontroller,
                        decoration: const InputDecoration(
                          hintText: 'enter here department name',
                          labelText: 'department name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: hodcontroller,
                        decoration: const InputDecoration(
                          hintText: 'enter here hod name',
                          labelText: 'hod name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: addresscontroller,
                        decoration: const InputDecoration(
                          hintText: 'enter your address',
                          labelText: 'Address',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  '$a',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
