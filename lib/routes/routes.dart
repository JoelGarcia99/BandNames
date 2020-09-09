import 'package:BandNames/src/page.home.dart';
import 'package:flutter/material.dart';

class Routes{

  static Routes _instance;

  factory Routes(){
    if(_instance == null){
      _instance = new Routes._internal();
    }
    return _instance;
  }

  Routes._internal();

  ///////////////////////////////////////////////////////////////
  Map<String, Widget Function(BuildContext)> buildRoutes()=>{
    "/": (_)=>HomePage()
  };

}