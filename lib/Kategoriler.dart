import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Kategoriler extends StatefulWidget {
  @override
  _KategorilerState createState() => _KategorilerState();
}

class _KategorilerState extends State<Kategoriler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
            Navigator.of(context).pop();
          }),
          title: Text('Kategoriler'),
          backgroundColor: Colors.blueGrey,
            ),
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(

                color: Colors.white,
                highlightColor: Colors.red,
                elevation: 10,
                child: Text(
                  "Kurumlar",
                  style: TextStyle(color: Colors.blueGrey),
                ),
                onPressed: () {
                  print("Butona 1 Kez Tıklandı");
                }
                ),
            RaisedButton(

                color: Colors.white,
                highlightColor: Colors.red,
                elevation: 10,
                child: Text(
                  "Kurumlar",
                  style: TextStyle(color: Colors.blueGrey),
                ),
                onPressed: () {
                  print("Butona 1 Kez Tıklandı");
                }
            ),
            RaisedButton(

                color: Colors.white,
                highlightColor: Colors.red,
                elevation: 10,
                child: Text(
                  "Kurumlar",
                  style: TextStyle(color: Colors.blueGrey),
                ),
                onPressed: () {
                  print("Butona 1 Kez Tıklandı");
                }
            ),



          ],




        ),
      ),
    );
  }
}
