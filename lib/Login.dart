// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:proyecto_flutter/Principal.dart';

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
                Navigator.push(context, MaterialPageRoute(builder: (context)=> PrincipalPage()));
              },
              child: const Text("Iniciar Sesion",style: TextStyle(fontWeight: FontWeight.bold, fontSize:15)),
            ),
          ],
        ),
      ),
    );
  }
}
