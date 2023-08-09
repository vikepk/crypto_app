import 'package:flutter/material.dart';
import 'price_screen.dart';
import 'package:crypto/pages/loading.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/loading',
      routes: {
        '/loading': (context) => Loading(),
        '/first': (context) => PriceScreen(),
      },
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.lightBlue,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(color: Colors.blue)),

      //home: PriceScreen(),
    );
  }
}
