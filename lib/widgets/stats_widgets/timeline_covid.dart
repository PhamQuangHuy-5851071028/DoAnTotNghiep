import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class timelineCovidScreen extends StatefulWidget {
  const timelineCovidScreen({Key key}) : super(key: key);

  @override
  _timelineCovidState createState() => _timelineCovidState();
}

class _timelineCovidState extends State<timelineCovidScreen> {
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
          title: Text("Biểu đồ Covid19",
              style: TextStyle(color: Colors.black, fontSize: 24)),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: WillPopScope(
          onWillPop: ()async{
            String url = await controller.currentUrl();
            if(url=="https://vn.tradingview.com/covid19/"){
              return true;
            }else{
              controller.goBack();
              return false;
            }
          },
          child: Scaffold(
            body: Container(
              child: SafeArea(
                child: WebView(
                  initialUrl: "https://vn.tradingview.com/covid19/",
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (WebViewController wc){
                    controller = wc;
                  },
                ),
              ),
            ),
          ),
        )
    );
  }
}

