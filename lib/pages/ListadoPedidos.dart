import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListadoPedidos extends StatefulWidget {
  ListadoPedidos({Key? key}) : super(key: key);

  @override
  State<ListadoPedidos> createState() => _ListadoPedidosState();
}

class _ListadoPedidosState extends State<ListadoPedidos> {

  List pedidosList = [];
  
  Future obtenerPedidos() async{
    var url = Uri.parse("http://192.168.200.14/apiFlutter/listarPedidos.php");
    var response = await http.get(url);
    if(response.statusCode == 200){
      setState(() {
        pedidosList = json.decode(response.body);
      });
      print(pedidosList);
      return pedidosList;
    }
  }

  void initState(){
    super.initState();
    obtenerPedidos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listado Pedidos"),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: pedidosList.length,
            itemBuilder:(context,index)=>
            Card(
              margin: const EdgeInsets.all(15),
              child: ListTile(
                leading: FlutterLogo(size: 50),
                title: Text(pedidosList[index]['shipper'], style:TextStyle(fontWeight: FontWeight.bold, fontSize:18)),
                subtitle: Text("A Nombre de: "+pedidosList[index]['consigner']),
                trailing: Icon(Icons.more_vert),
                isThreeLine: true,
              ),
            ),
          ),
      ),
    );
  }

}