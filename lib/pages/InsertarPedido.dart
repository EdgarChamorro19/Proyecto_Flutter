import 'package:flutter/material.dart';

class InsertarPedidos extends StatefulWidget {
  InsertarPedidos({Key? key}) : super(key: key);

  @override
  State<InsertarPedidos> createState() => _InsertarPedidosState();
}

class _InsertarPedidosState extends State<InsertarPedidos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Realizar Pedido"),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget> [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child:TextFormField(
                decoration: InputDecoration(
                prefixIcon: Icon(Icons.calendar_today_sharp),
                border: OutlineInputBorder(),
                labelText: 'Fecha'
                  ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child:TextFormField(
                decoration: InputDecoration(
                prefixIcon: Icon(Icons.store),
                border: OutlineInputBorder(),
                labelText: 'Shipper'
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}