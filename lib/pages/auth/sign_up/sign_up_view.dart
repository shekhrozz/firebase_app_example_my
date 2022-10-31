
import 'dart:developer';

import 'package:firebase_app_example_my/pages/auth/sign_in/sign_in_view.dart';
import 'package:firebase_app_example_my/pages/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';
class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {

  TextEditingController controllerEmail=TextEditingController();
  TextEditingController controllerPassword=TextEditingController();
    TextEditingController controllerConfirmation=TextEditingController();
    void get signUp async{
      try {
        if (controllerEmail.text.isEmpty||controllerPassword.text.isEmpty||controllerConfirmation.text.isEmpty) return;

        if(controllerConfirmation.text!=controllerPassword.text)return;
        final UserCredential credential=await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email:controllerEmail.text, password:controllerPassword.text);

          if(credential.user!=null){
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder:(context) => HomePage(),), (route) => false);
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
                hintText: 'email',
              ),
            ),
              TextField(
              controller: controllerPassword,
              decoration: const InputDecoration(
                hintText: 'password',
              ),
            ),
              TextField(
              controller: controllerConfirmation,
              decoration: const InputDecoration(
                hintText: 'confirm Password',
              ),
            ),
            CupertinoButton.filled(child:Text('sign up'), onPressed:() => signUp,),
             CupertinoButton.filled(child:Text('sign in'), onPressed:() => SignInView(),),       
          ],
        ),
      ),
    );
  }
}