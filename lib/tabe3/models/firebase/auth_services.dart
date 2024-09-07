import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:AG/tabe3/enum.dart';
import 'package:AG/tabe3/models/data.dart';

abstract class AuthServices{
  static Future<Data> login(String email, String password) async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return Data<String>("done", Status.success);
    }
    catch(e){
      log(e.toString());
      return Data<String>(e.toString(), Status.fail);
    }
  }
}