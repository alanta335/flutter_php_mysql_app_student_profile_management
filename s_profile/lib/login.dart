import 'package:flutter/material.dart';
import 'auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'sedetails.dart';
import 'main.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController regnoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in to your account'),
        backgroundColor: Colors.deepPurple.shade400,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: regnoController,
                decoration: InputDecoration(
                  hintText: 'Enter your registration no',
                  labelText: 'reg no',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            ElevatedButton(
              child: Text('Log in'),
              onPressed: () async {
                setState(() {
                  regno = regnoController.text;
                });
                Auth user_auth = new Auth(reg_no: regnoController.text);
                if (await user_auth.authentication(
                    regnoController.text, passwordController.text)) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Sedetails(regno: regno)),
                  );
                } else
                  print("Login fail ------------------");
              },
            ),
          ],
        ),
      ),
    );
  }
}
