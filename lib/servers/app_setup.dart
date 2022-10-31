import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app_example_my/firebase_options.dart';

// 1 - minSdkVersion 19
// 2 - multiDexEnabled true  androiddan pagesdan ozgartirish kk

// 3 - /// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,--------------> firebase-options.dart pagesdan tortib  kochirib olib kelinadi
/// );


class AppSetup {
  static Future<void> get setup async{
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}