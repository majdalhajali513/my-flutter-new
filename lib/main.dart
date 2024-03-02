import 'package:flutter/material.dart';
import 'package:my_flutter_new/Acount_user.dart';
import 'package:my_flutter_new/hode.dart';

import 'Acountdriver.dart';
import 'loginscreen.dart';

main (){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     initialRoute: 'home',
      routes: {'home':(context) => LoginScreen(),
      'acount':(context) => Acount(),
      'hode':(context)  => Home(),
        'driver':(context) => AcountDrive(),

      },
    );
  }
}