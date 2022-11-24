import 'package:firebase_app_example_my/pages/auth/sign_in/sign_in_view.dart';
import 'package:firebase_app_example_my/pages/home/home_page.dart';
import 'package:firebase_app_example_my/servers/app_setup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

         /*
          Created by BERDIYEV SHEKHROZ on 16:09:17 24.11.2022
          © 2022  
          Project ::: Sign in   SignUP
          */  
void main()async {
  await AppSetup.setup;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder<User?>(builder:(
        context, AsyncSnapshot<User?> snapshot) {
        
        if (snapshot.connectionState==ConnectionState.waiting) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }

        if (snapshot.connectionState==ConnectionState.active) {
          if (snapshot.hasData) {
            return const HomePage();
          }else{
            return const SignInView();
          }
        }
        return const SignInView();
      },
      )
    );
  }
}
