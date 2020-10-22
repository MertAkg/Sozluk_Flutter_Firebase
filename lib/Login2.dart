import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'NBar.dart';
import 'firebase.dart';
//import 'package:mango/Homepage.dart';

String name, email, photoUrl;

class GoogleAuthentication2 extends StatefulWidget {
  @override
  _GoogleAuthenticationState2 createState() => _GoogleAuthenticationState2();
}

class _GoogleAuthenticationState2 extends State<GoogleAuthentication2> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> googleSignIn() async {
    final GoogleSignInAccount googleSignInAccount =
    await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken);

    final UserCredential userCredential =
    await _firebaseAuth.signInWithCredential(authCredential);
    final User user = userCredential.user;
    assert(user.displayName != null);
    assert(user.email != null);
    assert(user.photoURL != null);

    setState(() {
      name = user.displayName;
      email = user.email;
      photoUrl = user.photoURL;
    });

    final User currentUser = _firebaseAuth.currentUser;
    assert(currentUser.uid == user.uid);

    return 'Logged In';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,

      appBar: AppBar(
        title: Text("Kısaltma Sözlüğü",
        style: TextStyle(
          fontWeight: FontWeight.w900,
              fontSize: 30,
        ),),
          backgroundColor: Colors.blueGrey),
      body: Container(

          child: Column(
            
            children:<Widget> [

              Expanded(

                  child: Container(
                    padding: const EdgeInsets.only(top: 150.0, left: 20, right: 20),
                    child: Text("Created By              Mert AKGÜNDÜZ", style: TextStyle(
                      fontWeight: FontWeight.w500,
                        fontSize: 40,
                        color: Colors.white
                    ),),
                  )
              )  ,


              Expanded(
              child: Container(
                child: Center(
                child: MaterialButton(
                  color: Colors.white,
                onPressed: () => googleSignIn().whenComplete(() {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => NBar()));
                }),
                child: Text('Googlela Bağlan', style: TextStyle(color: Colors.blueGrey),),
              ),
              )
          ),

              )

        ])
    ),
      );

  }
}