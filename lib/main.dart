import 'package:BandNames/routes/routes.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {

  final Routes routes = new Routes();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BandNames',
      initialRoute: '/',
      routes: routes.buildRoutes()
    );
  }
}