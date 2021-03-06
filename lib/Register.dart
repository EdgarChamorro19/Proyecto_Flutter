import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      debugShowCheckedModeBanner: false,
      title: "Proyecto",
      home: Register(
      ),
    );
  }
}

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _isObscure= true;
  TextEditingController controllerCedula = TextEditingController();
  TextEditingController controllerNombre = TextEditingController();
  TextEditingController controllerApellido = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget> [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5,vertical: 20),
              child: Text("Registrarse", style: TextStyle(fontWeight: FontWeight.bold, fontSize:30)),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child:TextFormField(
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                maxLength: 10,
                controller: controllerCedula,
                decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
                labelText: 'Cedula'
                  ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25,vertical: 20),
              child:TextFormField(
                textCapitalization: TextCapitalization.sentences,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                controller: controllerNombre,
                decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
                labelText: 'Nombre'
                  ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child:TextFormField(
                textCapitalization: TextCapitalization.sentences,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                controller: controllerApellido,
                decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
                labelText: 'Apellido'
                  ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25,vertical: 20),
              child:TextFormField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                controller: controllerEmail,
                decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
                labelText: 'Email'
                  ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child:TextFormField(
                obscureText: _isObscure,
                controller: controllerPassword,
                decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
                labelText: 'Contrase??a',
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
            Container(
              margin: EdgeInsets.symmetric(vertical: 25),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.indigoAccent,
                  minimumSize: Size( 340, 55),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(13))
                  ),
                ),
                onPressed: (){
                  registrarUsuarios();

                },
                child: const Text("Registrarse",style: TextStyle(fontWeight: FontWeight.bold, fontSize:15)),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Future registrarUsuarios() async {
    var url = Uri.parse("http://192.168.200.14/apiFlutter/agregarUsuario.php");
    var response= await http.post(url,body: {
      "Cedula": controllerCedula.text,
      "Nombre": controllerNombre.text, 
      "Apellido": controllerApellido.text,
      "Email": controllerEmail.text,
      "Password": controllerPassword.text,
      "Rol": 'Cliente'
    });
    if(response.statusCode == 200){
      Fluttertoast.showToast(
          msg: ("Usuario Registrado con Exito"),
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.greenAccent,
          textColor: Colors.white,
          fontSize: 16.0
        );
    }else{
      Fluttertoast.showToast(
          msg:("Error Pedido No se Realizo"),
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
        );

    }
  }
}