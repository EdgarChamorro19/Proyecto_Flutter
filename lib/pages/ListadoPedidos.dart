import 'package:flutter/material.dart';

class ListadoPedidos extends StatefulWidget {
  ListadoPedidos({Key? key}) : super(key: key);

  @override
  State<ListadoPedidos> createState() => _ListadoPedidosState();
}

class _ListadoPedidosState extends State<ListadoPedidos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listado Pedidos"),
      ),
    );
  }
}