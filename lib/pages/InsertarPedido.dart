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
                keyboardType: TextInputType.datetime,
                textInputAction: TextInputAction.next,
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
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                prefixIcon: Icon(Icons.store),
                border: OutlineInputBorder(),
                labelText: 'Shipper'
                  ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child:TextFormField(
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_rounded),
                border: OutlineInputBorder(),
                labelText: 'Consigner'
                  ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child:TextFormField(
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                prefixIcon: Icon(Icons.moped_outlined),
                border: OutlineInputBorder(),
                labelText: 'Carrier'
                  ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child:TextFormField(
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_rounded),
                border: OutlineInputBorder(),
                labelText: 'Tracking'
                  ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child:TextFormField(
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                prefixIcon: Icon(Icons.attach_money_outlined),
                border: OutlineInputBorder(),
                labelText: 'Valor de la Compra'
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}