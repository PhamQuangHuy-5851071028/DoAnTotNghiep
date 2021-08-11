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
    AppBar appBar = AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          )
      ),
      centerTitle: true,
      title: Text("Khai báo y tế",
          style: TextStyle(color: Colors.black, fontSize: 24)),
      backgroundColor: Colors.white,
      elevation: 0,
    );
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.white,
          extendBodyBehindAppBar: true,
          appBar: appBar,
          body: Padding(
            padding: const EdgeInsets.only(top: 57),
            child: Stack(
              children: <Widget>[
                WillPopScope(
                        onWillPop: ()async{
                          String url = await controller.currentUrl();
                          if(url=="https://tokhaiyte.vn/"){
                            return true;
                          }else{
                            controller.goBack();
                            return false;
                          }
                        },
                        child: WebView(
                          initialUrl: "https://tokhaiyte.vn/",
                          javascriptMode: JavascriptMode.unrestricted,
                          onWebViewCreated: (WebViewController wc){
                            controller = wc;
                          },
                        ),
                      ),
                Container(
                    height:  MediaQuery.of(context).size.height/4,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13),
                    ),
                    padding: const EdgeInsets.all(5),
                    child: googleMapScreen()
                ),
                  ],
                ),
            ),
          )
        );
  }
}

