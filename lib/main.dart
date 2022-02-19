import 'package:flutter/material.dart';
import 'package:proyecto_flutter/Login.dart';
import 'package:proyecto_flutter/Register.dart';


void main() => runApp(MiApp());


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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children:<Widget> [
            Center(
              child: Image.asset("imagenes/img2.png",width: 360, height: 450),
            ),
            Center(
              child: Text("Bienvenidos a Nuestra Aplicacion",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize:30)
                      ),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Register()));
              }, 
              child: Text("REGISTRARSE")
              ),
              ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
              },
              child: Text("YA TENGO UNA CUENTA")
              ),
          ],
        ),
      ),
    );
  }
}


