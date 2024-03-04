
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_flutter_new/loginscreen.dart';
class Home extends StatefulWidget {


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  int nindex=0;
  void _chang(int val){
  setState(() {
    nindex=val;
  });
  }
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
   endDrawer: Drawer(child:ListView(
     padding: EdgeInsets.zero,
     children: [
     DrawerHeader(
       decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('image/download.jpg',))
       ),
         child:Text('الملف الشخصي'),
     ),
       ListTile(trailing: Icon(Icons.folder),
         title: Text("my file"),
         onTap: (){
           Navigator.pop(context);
         },
       ),
       ListTile(trailing: Icon(Icons.supervisor_account_rounded),
       title: Text("shared with me"),
       onTap: (){
         Navigator.pop(context);
       },
       ),
       ListTile(trailing: Icon(Icons.star_outlined),
         title: Text("starred"),
         onTap: (){
           Navigator.pop(context);
         },
       ),
       ListTile(
         trailing: Icon(Icons.logout),
         title: Text('Logout'),
         onTap: () {
           Navigator.pushAndRemoveUntil(
               context,
               PageRouteBuilder(pageBuilder: (BuildContext context,
                   Animation animation, Animation secondaryAnimation) {
                 return LoginScreen();
               }, transitionsBuilder: (BuildContext context,
                   Animation<double> animation,
                   Animation<double> secondaryAnimation,
                   Widget child) {
                 return new SlideTransition(
                   position: new Tween<Offset>(
                     begin: const Offset(1.0, 0.0),
                     end: Offset.zero,
                   ).animate(animation),
                   child: child,
                 );
               }),
                   (Route route) => false);
         },
       ),

   ],)
   ),
      appBar: AppBar(
automaticallyImplyLeading: false,
        title: Text("خدمة نقل"),
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
                child: Container(child: TextButton(child:Text('push'),onPressed: (){

                }),),
              ),
            ]
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: nindex,
            onTap:_chang ,
           elevation: 0.0,
            iconSize: 20.0,
            backgroundColor: Colors.white,
            selectedFontSize: 15.0,
            selectedItemColor: Colors.blue,
            items: [ BottomNavigationBarItem(icon: Icon(Icons.add_alert_sharp),label: 'الإشعارات',),
              BottomNavigationBarItem(
          icon:Icon(Icons.local_shipping_outlined),
          label:'الحمولات',
        ),
          BottomNavigationBarItem(icon: Icon(Icons.local_shipping),label: 'الحمولةالنشطة',),

        ]
        ),

    );
  }
}
