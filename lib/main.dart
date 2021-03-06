import 'package:app_settings/app_settings.dart';
import 'package:camera_app/StringManipulation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  // This widget is the root
  // of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "ListView.builder",
        theme: new ThemeData(
            primarySwatch: Colors.green
        ),
        debugShowCheckedModeBanner: false,
        home: new HomePageState()
    );
  }
}
class HomePageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.cyan,
          title:Text("My App")
      ),
      body: Column(
        children: [
          ListTile(
            trailing: Icon(Icons.arrow_forward_ios),
            title:Text("Permission"),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MyHomePage()));
            },
          ),
          ListTile(
            trailing: Icon(Icons.arrow_forward_ios),
              title:Text("String Manipulation"),
              onTap:(){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => StringManipulation()));
              },
          ),
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future Camera() async{
    print('Camera permission method');
    await Permission.camera.request();
  }

  Future Location() async{
    print('Location permission method');
    await Permission.location.request();
  }

  @override
  void initState() {
    Location();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false,
        extendBody: true,
        backgroundColor: Colors.cyan,
        body: Center(
          child: Container(margin: EdgeInsets.all(20.0),decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0), color: Colors.white),height: MediaQuery.of(context).size.height/2,child: ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Stack(
              children: [
                Container(height: 120, decoration: BoxDecoration(image: DecorationImage(image: NetworkImage('https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg'),fit: BoxFit.fill))),
                Align(alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/12.9),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 60.0,
                              backgroundImage: NetworkImage("https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*.08, left: MediaQuery.of(context).size.width*.22),
                              child: FloatingActionButton(backgroundColor: Colors.cyan,child: Icon(Icons.photo_camera_outlined),onPressed: (){Camera();}),
                            )
                          ],
                        ),
                        SizedBox(height: 10.0,),
                        Text("Jons Patel",style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5.0),
                        Text("Jongpatel@gmail.com",style: TextStyle(color: Colors.grey, fontSize: 15,)),
                        Padding(
                          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/35.4),
                          child: Column(
                            children: [
                              Divider(),
                              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                                Column(
                                  children: [
                                    Text("Followers",style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)),
                                    SizedBox(height: 5.0),
                                    Text("1009",style: TextStyle(color: Colors.grey, fontSize: 12,)),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text("Following",style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)),
                                    SizedBox(height: 5.0),
                                    Text("500",style: TextStyle(color: Colors.grey, fontSize: 12,)),
                                  ],
                                ),
                              ],),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/2.4),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.green,
                      backgroundColor: Colors.green,
                      minimumSize: Size(MediaQuery.of(context).size.width, 65),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(0.0),
                      ),
                    ),
                    onPressed: () { AppSettings.openAppSettings(); },
                    child: Text(
                      "Settings",style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          )),
        )
    );
  }
}
