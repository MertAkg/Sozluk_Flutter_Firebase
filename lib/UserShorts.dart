import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sozluk/NBar.dart';

class UsersShorts extends StatefulWidget {
  @override
  _UsersShortsState createState() => _UsersShortsState();
}

class _UsersShortsState extends State<UsersShorts> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NBar()),
            );
              },),
        title: Text('Kısaltmalar'),
        backgroundColor: Colors.blueGrey,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream:FirebaseFirestore.instance.collection('NewData').snapshots(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: LinearProgressIndicator());
          }
          else{
            return new ListView(
                children: snapshot.data.docs.map((DocumentSnapshot documentSnapshot){
                  return Card(
                      child: ListTile(
                        title: Text(documentSnapshot.data()['data']),

                      )
                  );
                }).toList()
            );
          }
        },
      ),
    );
  }
}