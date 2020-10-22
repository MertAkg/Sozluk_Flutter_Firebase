import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  Future<void> _createUser() async{
    try {
      UserCredential userCredential = await FirebaseAuth
          .instance
          .createUserWithEmailAndPassword(email: _email, password: _password);

    }
    on FirebaseException catch(e){
      print ("Error: $e");
    }
    catch (e){
      print ("Error: $e");

    }
  }
  Future<void> _login() async{
    try {
      UserCredential userCredential = await FirebaseAuth
          .instance
          .signInWithEmailAndPassword(email: _email, password: _password);

    }
    on FirebaseException catch(e){
      print ("Error: $e");
    }
    catch (e){
      print ("Error: $e");

    }
  }

  String _email;
  String _password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Login")
        ),
        body: Center(
          child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  onChanged: (value){
                    _email= value;

                  },
                  decoration: InputDecoration(
                      hintText: "Enter Email..."
                  ),
                ),
                TextField(
                  onChanged: (value){
                    _password= value;

                  },
                  decoration: InputDecoration(
                      hintText: "Enter Pasword..."
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: _login,


                      child: Text("Login"),

                    ),
                    MaterialButton(
                      onPressed: _createUser,
                      child: Text("Create New Account"),

                    ),
                  ],
                )
              ]

          ),
        )
    );
  }
}

