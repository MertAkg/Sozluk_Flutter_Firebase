import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';

import 'Login2.dart';
import 'NBar.dart';


import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase.dart';
import 'loginpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      home:GoogleAuthentication2(),

      debugShowCheckedModeBanner: false,



    );
  }
}















