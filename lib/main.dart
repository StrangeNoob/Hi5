import 'package:flutter/material.dart';
import 'package:Hi5/web_view_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String url="https://hi5tpc.in";
  String urlS;
  SharedPreferences sharedPreferences;
  @override
  void initState() {
    super.initState();
    getLastURL();
  }

  void  getLastURL() async {
    sharedPreferences = await SharedPreferences.getInstance();
    String lastURL = sharedPreferences.getString('LastURL');
    
    if (lastURL == null) {
      lastURL = "https://hi5tpc.in";
    } 
    setState(() {
      print(lastURL);
      urlS = lastURL;
      print("Its last url is "+urlS);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        // ),
        body: (urlS != null) ? new WebViewContainer(urlS):
          new Center(
                   child: new CircularProgressIndicator(),
                 )
        );
  }

  
}
