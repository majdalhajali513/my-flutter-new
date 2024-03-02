import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_flutter_new/Acount_user.dart';
import 'package:my_flutter_new/hode.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberpwd = false;


  bool sec = true;
  var visable = Icon(
    Icons.visibility,
    color: Color(0xff4c5166),
  );
  var visableoff = Icon(
    Icons.visibility_off,
    color: Color(0xff4c5166),
  );
  final  passcontrooler=TextEditingController();
  final emailcontroller=TextEditingController();

  final formkey=GlobalKey<FormState>();
  bool passToggle=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (backgroundColor: Colors.black38,
      title:    Text(
        "Singing",
        style: TextStyle(
          color: Colors.white,
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: [
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
                    child: Form(
                      key:formkey ,
                      child: Column(
                        children: [
                        Image.asset('image/Untitled.jpg',height: 200,width: 300,),

                          buildEmail(),
                          SizedBox(
                            height: 20,
                          ),
                          buildPassword(),

                          SizedBox(height: 20.0,),
                          buildLoginButton(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buildRememberassword(),
                              buildForgetPassword()
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          buildCreatAcountDriv(),
                          buildCreateAcount(),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "الشروط والاحكام",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Email",
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 60,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Color(0xffebefff),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 2),
                )
              ]),
          child: TextFormField(
            controller: emailcontroller,
            validator: (value){
              if(value!.isEmpty){
    return 'Enter Email';
    }
                bool emailValid =
                RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value);
                if(!emailValid){
                  return 'Enter valid Email';


              }
            },


            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.email,
                  color: Color(0xff4c5166),
                ),
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        ),
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Password",
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Color(0xffebefff),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ],
          ),
          height: 60,
          child: TextFormField(
            controller: passcontrooler,
            validator: (data){
              if(data!.isEmpty){
                return 'This field is required';
              }
              else if(passcontrooler.text.length<10){
                return'password length should be more than 12 characters';
              }
            },
            obscureText: sec,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      sec = !sec;
                    });
                  },
                  
                  icon: sec ? visableoff : visable,
                ),
               
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.vpn_key,
                  color: Color(0xff4c5166),
                ),
                hintText: "pwd",
                hintStyle: TextStyle(color: Colors.black38)),
            
          ),
        )
      ],
    );
  }

  Widget buildRememberassword() {
    return Container(
      height: 20,
      child: Row(
        children: [
          Theme(
              data: ThemeData(unselectedWidgetColor: Colors.white),
              child: Checkbox(
                value: rememberpwd,
                checkColor: Colors.blueGrey,
                activeColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    rememberpwd = value!;
                  });
                },
              )),
          Text(
            "Remember me",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget buildForgetPassword() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        child: Text("Forget Password !",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        onPressed: () {},
      ),
    );
  }

  Widget buildLoginButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Container(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            if(formkey.currentState!.validate()){
              print("Data added Successfully");
              print('${emailcontroller.text}');
              print('${passcontrooler.text}');
              Navigator.pushNamed(context, 'hode');
              emailcontroller.clear();
              passcontrooler.clear();

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

  Widget buildCreateAcount() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Container(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, 'acount');
          },
          child: Text(
            "CreateAccount_User",
            style: TextStyle(
                fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
  Widget  buildCreatAcountDriv(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Container(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
Navigator.pushNamed(context, 'driver');
          },
          child: Text(
            "CreateAccount_Driver",
            style: TextStyle(
                fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );

  }
}

