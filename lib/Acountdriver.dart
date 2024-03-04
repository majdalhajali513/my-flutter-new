
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_flutter_new/hode.dart';

class AcountDrive extends StatefulWidget {
  @override
  _AcountloogD createState() => _AcountloogD();
}

class _AcountloogD extends State<AcountDrive> {
  var val = "hello";
  final formkey = GlobalKey<FormState>();
  final passcontrooler = TextEditingController();
  final Typecontrooler = TextEditingController();
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
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  int _age = 0;
  String _email = '';
  String _vehicleType = '';
  double _maxWeight = 0.0;

  @override
  Widget build(BuildContext context) {
    final isDesktop= MediaQuery.of(context).size.width>=600;
    final isMobile= MediaQuery.of(context).size.width < 600;

    double screenHeight= MediaQuery.of(context).size.height;
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
                        Color(0xffE3F2FD),
                        Color(0xffBBDEFB),
                        Color(0xff90CAF9),
                        Color(0xff64B5F6),
                        Color(0xff42A5F5),
                        Color(0xff2196F3),
                        Color(0xff1E88E5),
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
                              cursorColor: Colors.black,
                              controller: namecontrooler,
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
                                  hintText: "Name",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          25.0))),
                              style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 2.0,
                                  fontSize: 15.0),
                            ),
                            SizedBox(height: 20.0,),
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
                            SizedBox(height: 20.0,),
                            TextFormField(
                              autocorrect: false,
                              controller: emailcontrooler,
                              validator: (data) {
                                if (data!.isEmpty) {
                                  return 'This field is required';
                                }
                                bool emailValid =
                                RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(data);
                                if (!emailValid) {
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
                            SizedBox(height: 20.0,),
                            TextFormField(
                              controller: passcontrooler,
                              validator: (data) {
                                if (data!.isEmpty) {
                                  return 'This field is required';
                                }
                                else if (passcontrooler.text.length < 10) {
                                  return 'password length should be more than 12 characters';
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
                            SizedBox(height: 20.0,),
                            TextFormField(
                              controller: confpasscontrooler,
                              validator: (data) {
                                if (data!.isEmpty) {
                                  return 'This field is required';
                                }
                                else if (confpasscontrooler.text.length < 10) {
                                  return 'password length should be more than 12 characters';
                                }
                                if(data !=passcontrooler.text)
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
                            SizedBox(height: 20.0,),
                            TextFormField(
                              cursorColor: Colors.black,
                              controller: Typecontrooler,
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
                                  hintText: "Type Car",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          25.0))),
                              style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 2.0,
                                  fontSize: 15.0),
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
                Typecontrooler.clear();
              }
            },
            child: Text(
              "Login",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );
    }
  }
