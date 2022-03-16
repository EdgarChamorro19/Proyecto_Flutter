
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_flutter/Login.dart';
import 'package:proyecto_flutter/Principal.dart';
import 'package:proyecto_flutter/Register.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() => runApp(MiApp());

late String datofinal;
class MiApp extends StatelessWidget {
  const MiApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      debugShowCheckedModeBanner: false,
      title: "Proyecto",
      home: Inicio(
      ),
    );
  }
}

class Inicio extends StatefulWidget {
  Inicio({Key? key}) : super(key: key);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  @override
  void initState(){
    getValidationData().whenComplete(()async{
      Timer(Duration(seconds:2),() => Get.to(datofinal == null ? MiApp(): PrincipalPage()));
    });
    super.initState();
  }

  Future getValidationData() async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      var datofinal = sharedPreferences.getString('email');
    });
    print(datofinal);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children:<Widget> [
            Container(
              margin: EdgeInsets.symmetric(horizontal:20 ,vertical:40),
              child: Image.asset("imagenes/img2.png",height: 350),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
              child: Text("Bienvenidos a Nuestra Aplicacion",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize:30)
                      ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size( 340, 55),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(13))
                  ),
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                }, 
                child: Text("YA TENGO UNA CUENTA",style: TextStyle(fontWeight: FontWeight.bold, fontSize:15))
                ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 4),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size( 340, 55),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(13))
                  ),
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterPage()));
                },
                child: const Text("REGISTRARSE",style: TextStyle(fontWeight: FontWeight.bold, fontSize:15))
              ),
            ),
          ],
        ),
      ),
    );
  }
}


