import 'dart:developer';

import 'package:firebase_app_example_my/pages/auth/sign_up/sign_up_view.dart';
import 'package:firebase_app_example_my/pages/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {

  TextEditingController controllerEmail=TextEditingController();
  TextEditingController controllerPassword=TextEditingController();

void get signIn async {
  try {
    if(controllerEmail.text.isEmpty||controllerPassword.text.isEmpty){
      return;
    }
    final UserCredential credential=await FirebaseAuth.instance.signInWithEmailAndPassword(
      email:controllerEmail.text,
     password:controllerPassword.text);
    if (credential.user!=null) {
      Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder:(context) => const HomePage(),), (route) => false);
    }

  } catch (e) {
    
    log(e.toString());
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    body: SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: controllerEmail,
            decoration: const InputDecoration(
              hintText: 'email'
            ),
          ),
           TextField(
            controller: controllerPassword,
            decoration: const InputDecoration(
              hintText: 'password'
            ),
          ),
          CupertinoButton(child:Text('sign in'), 
          onPressed:() => signIn,),
          CupertinoButton(child:const Text('sign up') ,
           onPressed:() =>Navigator.of(context).push(MaterialPageRoute(builder:(context) =>SignUpView(),)),)

        ],
      ),
    ),
    );
  }
}