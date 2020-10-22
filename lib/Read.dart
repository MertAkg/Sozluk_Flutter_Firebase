
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Firestoreread extends StatefulWidget {
  @override
  _FirestorereadState createState() => _FirestorereadState();
}

class _FirestorereadState extends State<Firestoreread> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('Kısaltmalar'),
        backgroundColor: Colors.blueGrey,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream:FirebaseFirestore.instance.collection('Arama').snapshots(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: LinearProgressIndicator());
          }
          else{
            return new ListView(
                children: snapshot.data.docs.map((DocumentSnapshot documentSnapshot){
                  return Card(
                      child: ListTile(
                        title: Text(documentSnapshot.data()['kıs']),

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