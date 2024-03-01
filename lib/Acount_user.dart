
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_flutter_new/hode.dart';

class Acount extends StatefulWidget {
  @override
  _Acountloog createState() => _Acountloog();
}

class _Acountloog extends State<Acount> {
  var val = "hello";
  bool sec=true;
  var visable = Icon(
    Icons.visibility,
    color: Color(0xff4c5166),
  );
  var visableoff = Icon(
    Icons.visibility_off,
    color: Color(0xff4c5166),
  );
  TextEditingController textcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,
        title: Text("CreateAcount"),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
              child: Stack(children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff65b0bb),
                    Color(0xff5a9ea8),
                    Color(0xff508c95),
                    Color(0xff467b82),
                    Color(0xff3c6970),
                    Color(0xff32585d),
                    Color(0xff28464a),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(children: [
                      SizedBox(
                        height: 100,
                      ),
                      //name
                      TextField(
                        cursorColor: Colors.black,
                        textAlign: TextAlign.right,
                        autocorrect: false,
                        autofocus: true,
                        onChanged: (value) {},
                        keyboardType: TextInputType.name,
                        onEditingComplete: () {},
                        maxLength: 15,
                        maxLines: null,
                        decoration: InputDecoration(
                            filled: true,
                            suffixStyle: TextStyle(
                              fontSize: 15.0,
                            ),
                            hintStyle: TextStyle(color: Colors.white),
                            hintText: "Name",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0))),
                        style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 2.0,
                            fontSize: 15.0),
                      ),

                      SizedBox(height: 25.0,),
                      //last name
                      TextField(
                        cursorColor: Colors.black,
                        controller: textcontroller,
                        textAlign: TextAlign.right,
                        autocorrect: false,
                        autofocus: true,
                        onChanged: (value) {},
                        keyboardType: TextInputType.name,
                        onEditingComplete: () {},
                        maxLength: 20,
                        maxLines: null,
                        decoration: InputDecoration(
                            filled: true,
                            suffixStyle: TextStyle(
                              fontSize: 15.0,
                            ),
                            hintStyle: TextStyle(color: Colors.white),
                            hintText: "Last Name",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0))),
                        style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 2.0,
                            fontSize: 15.0),
                      ),
                      SizedBox(height:25.0),
                      //Email
                      TextField(
                        autocorrect: false,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: Colors.black),
                        cursorColor: Colors.black,
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email,
                              color: Color(0xff4c5166),
                            ),
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0))),

        ),
SizedBox(height: 25.0,),
                      //password
                      TextField(
                        autocorrect: false,
                        obscureText: sec,
                        keyboardType: TextInputType.visiblePassword,
                        style: TextStyle(color: Colors.black),
                        cursorColor: Colors.black,
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  sec = !sec;
                                });
                              },
                              icon: sec ? visableoff : visable,
                            ),
                            prefixIcon: Icon(
                              Icons.vpn_key,
                              color: Colors.black26,
                            ),
                            hintText: 'password',
                            hintStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),),),

                      ),
                      SizedBox(height: 25.0),
                      TextField(
                        autocorrect: false,
                        obscureText: sec,
                        keyboardType: TextInputType.visiblePassword,
                        style: TextStyle(color: Colors.black),
                        cursorColor: Colors.black,
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                sec = !sec;
                              });
                            },
                            icon: sec ? visableoff : visable,
                          ),
                          prefixIcon: Icon(
                            Icons.vpn_key,
                            color: Colors.black26,
                          ),
                          hintText: 'Confirm password',
                          hintStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),),),

                      ),

                      SizedBox(height: 50.0,),
                      buildLoginButton(context),
                    ],
                    ),
                  ),
                ),
              ),
            ),
          ]))),
    );
  }


}
Widget buildLoginButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 25),
    child: Container(
      width: double.infinity,

      child: ElevatedButton(
        onPressed: () {

     Navigator.pushNamed(context, 'hode');
        },
        child: Text(
          "Login",
          style: TextStyle(
              fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}