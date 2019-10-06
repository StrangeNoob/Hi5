import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainer extends StatefulWidget {
  final url;

  WebViewContainer(this.url);

  @override
  createState() => _WebViewContainerState(this.url);
}

class _WebViewContainerState extends State<WebViewContainer> {
  var _url;
  final _key = UniqueKey();

  _WebViewContainerState(this._url);

  addLastURL(String URL) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('LastURL', URL);
    print(URL);
  }

  getLastURL() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String lastURL = sharedPreferences.getString('LastURL');
    print(lastURL);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        bottomOpacity: 0.0,
      ),
      body: Column(
          children: [
            Expanded(
              child: WebView(
                key: _key,
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: _url,
                onPageFinished: (String Url) {
                  // print(Url);
                  addLastURL(Url);
                  getLastURL();
                },
              ),
            ),
          ],
        ),
      //),
    );
  }
}
