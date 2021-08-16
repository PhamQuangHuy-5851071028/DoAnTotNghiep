import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class mapCovidScreen extends StatefulWidget {
  const mapCovidScreen({Key key}) : super(key: key);

  @override
  _mapCovidState createState() => _mapCovidState();
}

class _mapCovidState extends State<mapCovidScreen> {
  WebViewController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          centerTitle: true,
          title: Text("Bản đồ Covid-19",
              style: TextStyle(color: Colors.black, fontSize: 24)),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: WillPopScope(
          onWillPop: () async {
            String url = await controller.currentUrl();
            if (url == "https://www.bing.com/covid/local/vietnam?vert=graph") {
              return true;
            } else {
              controller.goBack();
              return false;
            }
          },
          child: Scaffold(
            body: Container(
              child: SafeArea(
                child: WebView(
                  initialUrl:
                      "https://www.bing.com/covid/local/vietnam?vert=graph",
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (WebViewController wc) {
                    controller = wc;
                  },
                ),
              ),
            ),
          ),
        ));
  }
}
