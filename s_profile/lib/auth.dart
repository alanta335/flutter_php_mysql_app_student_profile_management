import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
//import 'package:crypto/crypto.dart';
class Auth{
    Auth({required this.reg_no});
    final String reg_no;
    Future<bool> authentication(user,pass) async{
        //var x = utf8.encode(pass);
        //var sha_pass = sha256.convert(x);
        Uri url = Uri(
        scheme: "http", host: '192.168.0.101', path: '/flutter/login.php');
        var data = {
            'reg_no' : user,
            'pass' : pass
        };
        var res = await http.post(url, body: data);
        print(jsonDecode(res.body));
        var s = jsonDecode(res.body);
        if(s['status'] == "Auth_success"){
            return true;
        }
        else
            return false;
    }
}