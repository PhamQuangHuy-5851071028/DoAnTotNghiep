import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:MyCovid19/screens/googlemap.dart';

class healthDeclarationWebScreen extends StatefulWidget {
  const healthDeclarationWebScreen({Key key}) : super(key: key);

  @override
  _healthDeclarationWebState createState() => _healthDeclarationWebState();
}

class _healthDeclarationWebState extends State<healthDeclarationWebScreen> {
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
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => googleMapScreen()),
                  );
                },
                icon: Icon(Icons.location_on, color: Colors.blue,
                )
            ),
          ],
          centerTitle: true,
          title: Text("Khai báo y tế",
              style: TextStyle(color: Colors.black, fontSize: 24)),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: WillPopScope(
          onWillPop: ()async{
            String url = await controller.currentUrl();
            if(url=="https://tokhaiyte.vn/"){
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
                  initialUrl: "https://tokhaiyte.vn/",
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

