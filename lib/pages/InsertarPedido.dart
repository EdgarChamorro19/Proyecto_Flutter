import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
class InsertarPedidos extends StatefulWidget {
  InsertarPedidos({Key? key}) : super(key: key);

  @override
  State<InsertarPedidos> createState() => _InsertarPedidosState();
}

class _InsertarPedidosState extends State<InsertarPedidos> {

  late DateTime _selectedDate;
  TextEditingController controllerFecha= TextEditingController();
  TextEditingController controllerShipper= TextEditingController();
  TextEditingController controllerConsigner= TextEditingController();
  TextEditingController controllerTracking= TextEditingController();
  TextEditingController controllerCarrier= TextEditingController();
  TextEditingController controllerDetallePedido= TextEditingController();
  TextEditingController controllerValorCompra= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Realizar Pedido"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget> [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child:TextFormField(
                controller: controllerFecha,
                onTap: (){
                  showDatePicker(
                    context: context, 
                    initialDate: DateTime.now(), 
                    firstDate: DateTime(2000), 
                    lastDate: DateTime(2100)).then((selectedDate){
                      if(selectedDate != null){
                        controllerFecha.text=selectedDate.toString();
                      }
                    });
                },
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
                controller: controllerShipper,
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
                controller: controllerConsigner,
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
                controller: controllerCarrier,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                prefixIcon: Icon(Icons.delivery_dining),
                border: OutlineInputBorder(),
                labelText: 'Carrier'
                  ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child:TextFormField(
                controller: controllerTracking,
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
                controller: controllerValorCompra,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                prefixIcon: Icon(Icons.attach_money_outlined),
                border: OutlineInputBorder(),
                labelText: 'Valor de la Compra'
                  ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child:TextFormField(
                maxLines: 5,
                controller: controllerDetallePedido,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                prefixIcon: Icon(Icons.description),
                border: OutlineInputBorder(),
                labelText: 'Detalle Pedido'
                  ),
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
                  ingresarPedido();
                },
                child: const Text("Realizar Pedido",style: TextStyle(fontWeight: FontWeight.bold, fontSize:15)),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  void ingresarPedido(){
    var url = Uri.parse("http://192.168.200.14/apiFlutter/agregarPedidos.php");
    http.post(url,body: {
      "fecha": controllerFecha.text,
      "shipper": controllerShipper.text, 
      "consigner": controllerConsigner.text,
      "carrier": controllerCarrier.text,
      "tracking": controllerTracking.text,
      "valorcompra": controllerValorCompra.text,
      "detalle": controllerDetallePedido.text,
      "estado": 'Por Confirmar'
    });
  
  }
}
