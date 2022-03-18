import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Perfil extends StatefulWidget {
  Perfil({Key? key}) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil"),
        backgroundColor: Colors.indigoAccent,
      ),
      body: Column(
        children:<Widget>[
          Container(
            alignment: Alignment.center,
            color: Colors.indigoAccent[100],
            child: Image.asset("imagenes/user.png",width: 120,height: 160),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical:10),
            alignment: Alignment.center,
            color: Colors.indigoAccent[100],
            child: Text("Nombre Usuario",style: TextStyle(fontWeight: FontWeight.bold, fontSize:30,color: Colors.white)),
          ),
        ],
      ),
    );
  }
}