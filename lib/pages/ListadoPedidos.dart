import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ListadoPedidos extends StatefulWidget {
  ListadoPedidos({Key? key}) : super(key: key);

  @override
  State<ListadoPedidos> createState() => _ListadoPedidosState();
}

class _ListadoPedidosState extends State<ListadoPedidos> {

  List pedidosList = [];
  
  Future obtenerPedidos() async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var cedusuario= sharedPreferences.getString('cedula');
    var url = Uri.parse("http://192.168.200.14/apiFlutter/listarPedidos.php");
    var response = await http.post (url, body: {
      "Cedula":cedusuario,
    });
    if(response.statusCode == 200){
      setState(() {
        pedidosList = json.decode(response.body);
      });
      print(pedidosList);
      var estado= pedidosList[0]['estado'];
      sharedPreferences.setString('Estado', estado);
      return pedidosList;
    }
  }

  void initState(){
    super.initState();
    obtenerPedidos();
  }

  // ignore: prefer_final_fields
  List<Map<String, IconData>> _categories = [
    {
      'Por Confirmar': Icons.access_time_outlined
    },
    {
      'Aceptado': Icons.check
    },
    {
      'Cancelado': Icons.cancel
    },
    {
      'Enviado': Icons.delivery_dining_outlined
    },
];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Listado Pedidos"),
        backgroundColor: Colors.indigoAccent,
      ),
      body: Container(
        child: ListView.builder(
            itemCount: pedidosList.length,
            itemBuilder:(context,index)=>
            Card(
              elevation: 5,
              margin: const EdgeInsets.all(15),
              child: ListTile(
                minVerticalPadding: 10,
                leading: FlutterLogo(size: 45),
                title: Text(pedidosList[index]['shipper'], style:TextStyle(fontWeight: FontWeight.bold, fontSize:18)),
                subtitle: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text("Id Pedido: "+pedidosList[index]['id']+"     "+"Total: \$"+pedidosList[index]['valorcompra']),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text("A Nombre de: "+pedidosList[index]['consigner']),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text("Detalle: "+pedidosList[index]['detalle']),
                    ),
                  ],
                ),
                trailing:
                    Container(
                      padding: EdgeInsets.symmetric(vertical:10),
                      child: Icon(_categories[0][pedidosList[index]['estado']]),
                    ),
                isThreeLine: true,
              ),    
            ),
          ),
      ),
    );
  }

}