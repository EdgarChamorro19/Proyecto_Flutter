import 'package:flutter/material.dart';
import 'package:proyecto_flutter/pages/InsertarPedido.dart';
import 'package:proyecto_flutter/pages/ListadoPedidos.dart';
import 'package:proyecto_flutter/pages/Perfil.dart';

class PrincipalPage extends StatelessWidget {
  const PrincipalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      debugShowCheckedModeBanner: false,
      title: "Principal",
      home: Principal(
      ),
    );
  }
}

class Principal extends StatefulWidget {
  Principal({Key? key}) : super(key: key);

  @override
  State<Principal> createState() => _PrincipalState();
}


class _PrincipalState extends State<Principal> {
  int currentIndex = 0;
  final screens =[
    ListadoPedidos(),
    InsertarPedidos(),
    Perfil()
  ];

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_grocery_store_rounded),
            label: 'Realizar Pedido',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin_rounded),
            label: 'Usuario',
          ),
        ],
        currentIndex: currentIndex,
        selectedItemColor: Colors.indigo[300],
        onTap: _onItemTapped,
      ),
    );
  }
}