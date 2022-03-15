
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proyecto_flutter/Principal.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      debugShowCheckedModeBanner: false,
      title: "Login",
      home: login(
      ),
    );
  }
}

class login extends StatefulWidget {
  login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  bool _isObscure= true;

  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget> [
            Center(
              child: Image.asset("imagenes/user.png",width: 170,height: 260),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child:TextFormField(
                controller: controllerEmail,
                decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
                labelText: 'Correo Electronico'
                  ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25,vertical: 18),
              child:TextFormField(
                controller: controllerPassword,
                obscureText: _isObscure,
                decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
                labelText: 'Contraseña',
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscure ? Icons.visibility:Icons.visibility_off
                  ),
                  onPressed: (){
                    setState(() {
                      _isObscure=!_isObscure;
                    });
                  },
                ),
                  ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size( 340, 55),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(13))
                ),
              ),
              onPressed: (){
                login();
              },
              child: const Text("Iniciar Sesion",style: TextStyle(fontWeight: FontWeight.bold, fontSize:15)),
            ),
          ],
        ),
      ),
    );
  }

  Future login() async {
    var url=Uri.parse("http://192.168.200.14/apiFlutter/login.php");
    var response = await http.post (url, body: {
      "Email":controllerEmail.text,
      "Password":controllerPassword.text,
    });
    var data = json.decode(response.body);
      if (data=="Success") {
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString('email', controllerEmail.text);

        Fluttertoast.showToast(
          msg: "Bienvenido",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
        );

        Navigator.push(context, MaterialPageRoute(builder: (context)=> PrincipalPage()));
      }else{
        Fluttertoast.showToast(
          msg: "Error",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
        );
      }
  }
}