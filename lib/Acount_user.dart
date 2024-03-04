
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_flutter_new/hode.dart';

class Acount extends StatefulWidget {
  @override
  _Acountloog createState() => _Acountloog();
}

class _Acountloog extends State<Acount> {
  var val = "hello";
  final formkey = GlobalKey<FormState>();
  final passcontrooler = TextEditingController();
  final confpasscontrooler = TextEditingController();
  final namecontrooler = TextEditingController();
  final lastnamecontrooler = TextEditingController();
  final emailcontrooler = TextEditingController();
  bool sec = true;
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
        backgroundColor: Colors.black38,
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
                        Color(0xffE0F2F1),
                        Color(0xffB2DFDB),
                        Color(0xff80CBC4),
                        Color(0xff4DB6AC),
                        Color(0xff26A69A),
                        Color(0xff009688),
                        Color(0xff00897B),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: SingleChildScrollView(
                      child: Container(
                        child: Form(
                          key: formkey,
                          child: Column(children: [
                            SizedBox(
                              height: 100,
                            ),
                            //name
                            TextFormField(
                              controller: namecontrooler,
                              validator: (data) {
                                if (data!.isEmpty) {
                                  return 'This field is required';
                                }
                              },
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
                                      borderRadius: BorderRadius.circular(
                                          25.0))),
                              style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 2.0,
                                  fontSize: 15.0),
                            ),

                            SizedBox(height: 25.0,),
                            //last name
                            TextFormField(
                              cursorColor: Colors.black,
                              controller: lastnamecontrooler,
                              validator: (data) {
                                if (data!.isEmpty) {
                                  return 'This field is required';
                                }
                              },
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
                                      borderRadius: BorderRadius.circular(
                                          25.0))),
                              style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 2.0,
                                  fontSize: 15.0),
                            ),
                            SizedBox(height: 25.0),
                            //Email
                            TextFormField(
                              autocorrect: false,
                              controller: emailcontrooler,
                              validator: (data) {
                                if (data!.isEmpty) {
                                  return 'This field is required';
                                }
    bool emailValid =
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(data);
    if(!emailValid) {
      return 'Enter valid Email';
    }
    },
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
                                      borderRadius: BorderRadius.circular(
                                          25.0))),

                            ),
                            SizedBox(height: 25.0,),
                            //password
                            TextFormField(
                              controller: passcontrooler,
                              validator: (data) {
                                if (data!.isEmpty) {
                                  return 'This field is required';
                                }
                                else if(passcontrooler.text.length<7){
                                  return'password length should be more than 7 characters';
                                }
                              },
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
                            TextFormField(
                              controller: confpasscontrooler,
                              validator: (data) {
                                if (data!.isEmpty) {
                                  return 'This field is required';
                                }
                                else if(confpasscontrooler.text.length<7){
                                  return'password length should be more than 7 characters';
                                }
                                if(data!=passcontrooler.text)
                                return 'Not match';

                              },
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
                ),
              ]))),
    );
  }


  Widget buildLoginButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Container(
        width: double.infinity,

        child: ElevatedButton(
          onPressed: () {
            if (formkey.currentState!.validate()) {
              Navigator.pushNamed(context, 'hode');
              print('${namecontrooler.text}');
              print('${lastnamecontrooler.text}');
              print('${emailcontrooler.text}');
              print('${passcontrooler.text}');
              print('${confpasscontrooler.text}');
              namecontrooler.clear();
              lastnamecontrooler.clear();
              emailcontrooler.clear();
              passcontrooler.clear();
              confpasscontrooler.clear();


            }


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
}