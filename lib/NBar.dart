import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'Read.dart';
import 'Search.dart';
import 'UserShorts.dart';
import 'firebase.dart';

class NBar extends StatefulWidget {
  @override
  _NBarState createState() => _NBarState();
}

class _NBarState extends State<NBar> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    FirebaseOperations(),
    Firestoreread(),
    CloudFirestoreSearch(),
    UsersShorts()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      backgroundColor: Colors.blueGrey,
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.white,
        backgroundColor: Colors.blueGrey,
        buttonBackgroundColor: Colors.white,
        height: 60,
        items: <Widget>[
          Icon(Icons.add, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.search, size: 30),
          Icon(Icons.library_books, size: 30)
        ],
        animationDuration: Duration(
            milliseconds: 380
        ),
        onTap: (index) { setState(() {
          _currentIndex = index;

        });

          //Handle button tap
        },
      ),




    );
  }
}


