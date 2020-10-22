import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'UserShorts.dart';

class FirebaseOperations extends StatefulWidget {
  @override
  _FirebaseOperationsState createState() => _FirebaseOperationsState();
}

class _FirebaseOperationsState extends State<FirebaseOperations> {
  TextEditingController textEditingController = TextEditingController();

  @override

  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: Colors.blueGrey,


      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          showDialog(context: context, builder: (context)=> AlertDialog(
            title: Text('Kısaltmanız Eklendi'),
            content: Text('Kütüphanem sekmesinde eklediğiniz kısalatmaları bulabilirsiniz'),
            actions:<Widget> [
              FlatButton(
                child: Text('Harika'),
                    onPressed: () {
                  Navigator.of(context).pop();
                    }
              ),
            ],
          ),
          );
          await FirebaseFirestore.instance.collection('NewData').add({
            'data': textEditingController.text
          });
        },
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add_circle, size: 40,
          color: Colors.blueGrey,
        ),
      ),
      appBar: new AppBar(
        title: Text('Kısaltma Ekle',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueGrey,
        actions: [
          FlatButton.icon(
              onPressed: () =>
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => UsersShorts())),
              icon: Icon(
                Icons.chrome_reader_mode,
                color: Colors.white,

              ),
              label: Text(
                "Kütüphanem",
                style: TextStyle(color: Colors.white),
              )
          )
        ],

      ),


      body:
      Container(



        child: Padding(

            padding: const EdgeInsets.only(top: 150.0, left: 20, right: 20),
            child: TextField(

              controller: textEditingController,
              decoration: InputDecoration(

                  hintText: 'Yazmaya başlayın...',
                  hintStyle: TextStyle(fontWeight: FontWeight.bold)
              ),

            )
        ),
      ),
    );


  }
}