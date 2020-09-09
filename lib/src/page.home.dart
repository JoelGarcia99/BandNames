import 'package:BandNames/models/band.dart';
import "package:flutter/material.dart";

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<BandModel> band = [
    new BandModel(id: '0', name:'Alan Walker', votes: 10 ),
    new BandModel(id: '1', name:'Imagine Dragons', votes: 10 ),
    new BandModel(id: '2', name:'Vicente Fernandez', votes: 10 ),
    new BandModel(id: '3', name:'The Score', votes: 10 ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BandNames', style: TextStyle(color: Colors.black54)),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: ListView.builder(
        itemCount: band.length,
        itemBuilder: (context, index)=>_bandTile(band[index])
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _addBand,
        elevation: 1,
      ),
    );
  }

  Widget _bandTile(BandModel band) {
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      background: Container(
        color: Colors.red,
        padding: EdgeInsets.only(left: 10.0),
        child: Row(
          children: [
            Icon(Icons.delete_forever, color: Colors.white),
            Text(
              "Eliminar Banda", 
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))
          ],
        ),
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(band.name.substring(0, 2)),
          backgroundColor: Colors.blue[100],
        ),
        title: Text(band.name),
        trailing: Text(band.votes.toString()),
        onTap: (){},
      ),
    );
  }

  void _addBand(){

    final controller = new TextEditingController();

    showDialog(
      context: context,
      child: AlertDialog(
        title: Text("Agregar nueva banda"),
        content: TextField(
          controller: controller,
        ),
        actions: [
          FlatButton.icon(
            onPressed: ()=>_addBandToQueue(controller.text), 
            icon: Icon(Icons.check_circle), 
            label: Text("Agregar")
          )
        ],
      )
    );

  }

  void _addBandToQueue(String name){

    if(name.length>1){
      band.add(new BandModel(id: DateTime.now().toIso8601String(), name: name, votes:0));
      setState((){});
    }

    Navigator.of(context).pop();
  }
}