import 'package:firebase_app_example_my/pages/auth/sign_in/sign_in_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:developer';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void logout(BuildContext context)async{
    try {
      await FirebaseAuth.instance.signOut();
     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
      builder:(context) => SignInView()), (route) => false);
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(onPressed:() =>logout(context), 
          icon:const Icon(Icons.logout))
        ],
      ),
    );
  }
}