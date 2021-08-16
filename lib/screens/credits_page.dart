import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class CreditsScreen extends StatelessWidget {
  final PageController controller;

  const CreditsScreen({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Bản quyền',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 28,
            )),
      ),

      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Image.asset(
                'assets/launcher/launcher.png',
                height: 200,
                width: 200,
              ),
              //App Name
              SizedBox(
                height: 10,
              ),
              Text(
                "MyCovid19",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                maxLines: 1,
              ),
              SizedBox(
                height: 10,
              ),

              //Version number
              Text(
                "Phiên bản 1.0.0",
                style: TextStyle(
                  fontSize: 15,
                  letterSpacing: 0.5,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.normal,
                  color: Colors.indigo[900],
                ),
                maxLines: 1,
              ),
              //License Button
              Padding(
                padding: EdgeInsets.all(25),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1.4,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(width: 5),
                      const Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 18,
                      ),
                      SizedBox(width: 5),
                      AutoSizeText(
                        "Được tạo ra bởi ",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        maxFontSize: 15,
                        maxLines: 1,
                      ),
                      AutoSizeText(
                        "Phạm Quang Huy",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                        maxFontSize: 15,
                        maxLines: 1,
                      ),
                      SizedBox(width: 5),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                // ignore: deprecated_member_use
                child: FlatButton(
                  padding: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Color(0xFFF5F6F9),
                  onPressed: _launchURL,
                  child: Row(
                    children: [
                      Icon(
                        Icons.facebook,
                        color: Colors.blue[900],
                        size: 25.0,
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          'Liên hệ với tác giả',
                          style: TextStyle(
                              color: Colors.indigo[900],
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // body: Stack(
      //   children: <Widget>[
      //     //Back Button & Heading
      //     Align(
      //       alignment: Alignment.topLeft,
      //       child: Row(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         mainAxisAlignment: MainAxisAlignment.start,
      //         children: <Widget>[
      //           InkWell(
      //             onTap: () {
      //
      //             },
      //             child: Padding(
      //               padding: const EdgeInsets.all(20),
      //               child: Container(
      //                 decoration: BoxDecoration(
      //                     color: Colors.transparent,
      //                     borderRadius: BorderRadius.circular(5),
      //                     border: Border.all(
      //                       color: Colors.black,
      //                       width: 1.8,
      //                     )),
      //                 padding: const EdgeInsets.all(6),
      //                 child: const Icon(
      //                   Icons.arrow_back_ios,
      //                   color: Colors.black,
      //                   size: 18,
      //                 ),
      //               ),
      //             ),
      //           ),
      //           Padding(
      //             padding: const EdgeInsets.fromLTRB(65, 25, 50, 0),
      //             child: AutoSizeText(
      //               "Bản quyền",
      //               style: TextStyle(
      //                 fontSize: 21,
      //                 fontFamily: "Montserrat",
      //                 fontWeight: FontWeight.w600,
      //                 color: Colors.black,
      //               ),
      //               maxFontSize: 21,
      //               maxLines: 1,
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //
      //     //Column of image, name and button
      //     Positioned.fill(
      //       top: 70,
      //       child: Align(
      //         alignment: Alignment.center,
      //         child: LayoutBuilder(
      //           builder: (ctx,constraint)=>Column(
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             children: <Widget>[
      //               Image(
      //                 width: constraint.maxHeight*0.31,
      //                 height: constraint.maxHeight*0.31,
      //                 image: AssetImage("assets/corona_virus.png"),
      //               ),
      //
      //               SizedBox(height: 20),
      //
      //               //App Name
      //               AutoSizeText(
      //                 "Covid Tracker",
      //                 style: TextStyle(
      //                   fontSize: 25,
      //                   fontFamily: "Montserrat",
      //                   fontWeight: FontWeight.w600,
      //                   color: Colors.black,
      //                 ),
      //                 maxLines: 1,
      //                 maxFontSize: 25,
      //               ),
      //
      //               //Version number
      //               AutoSizeText(
      //                 "Version 1.0.0",
      //                 style: TextStyle(
      //                   fontSize: 18,
      //                   letterSpacing: 0.5,
      //                   fontFamily: "Montserrat",
      //                   fontWeight: FontWeight.w600,
      //                   color: Color(0xff009a88),
      //                 ),
      //                 maxFontSize: 18,
      //                 maxLines: 1,
      //               ),
      //
      //               SizedBox(height: 10),
      //
      //               //License Button
      //               MaterialButton(
      //                 elevation: 10,
      //                 onPressed: () {},
      //                 child: Container(
      //                   decoration: BoxDecoration(
      //                     color: Color(0xff009a88),
      //                     border: Border.all(color: Color(0xff009a88), width: 2),
      //                     borderRadius: BorderRadius.circular(5),
      //                   ),
      //                   padding:
      //                       EdgeInsets.symmetric(horizontal: 25, vertical: 8),
      //                   child: AutoSizeText(
      //                     "Giấy phép",
      //                     style: TextStyle(
      //                       fontSize: 18,
      //                       fontFamily: "Montserrat",
      //                       fontWeight: FontWeight.w600,
      //                       color: Colors.white,
      //                     ),
      //                     maxFontSize: 18,
      //                     maxLines: 1,
      //                   ),
      //                 ),
      //               )
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //
      //     //Paragraph
      //     Positioned(
      //       top: 350,
      //       width: MediaQuery.of(context).size.width,
      //       child: Padding(
      //         padding: const EdgeInsets.all(15),
      //         child: AutoSizeText(
      //           "Covid Tracker là một ứng dụng được tạo ra để cung cấp thông tin trên toàn thế giới liên quan đến đại dịch Covid-19."
      //               " Nó cho thấy sự ảnh hưởng, phục hồi, tử vong, các xét nghiệm và xác suất lây nhiễm cho mỗi quốc gia.",
      //           style: TextStyle(
      //             fontSize: 16,
      //             letterSpacing: 0.4,
      //             height: 1.6,
      //             fontFamily: "Montserrat",
      //             fontWeight: FontWeight.w600,
      //             color: Color(0xff008e7b),
      //           ),
      //           maxFontSize: 16,
      //           textAlign: TextAlign.justify,
      //         ),
      //       ),
      //     ),
      //
      //     //Author Credits
      //     Positioned.fill(
      //       bottom: 25,
      //       child: Align(
      //         alignment: Alignment.bottomCenter,
      //         child: InkWell(
      //           onTap: () async {
      //             const url = 'https://www.facebook.com/QHuyPham.3399/';
      //             if (await canLaunch(url)) {
      //               await launch(
      //                 url,
      //                 forceSafariVC: false,
      //                 forceWebView: false,
      //               );
      //             } else {
      //               throw 'Could not launch $url';
      //             }
      //           },
      //           child: Container(
      //             decoration: BoxDecoration(
      //               border: Border.all(
      //                 color: Colors.black,
      //                 width: 1.4,
      //               ),
      //               borderRadius: BorderRadius.circular(6),
      //             ),
      //             margin: const EdgeInsets.symmetric(horizontal: 15),
      //             padding: const EdgeInsets.symmetric(vertical: 10),
      //             child: Row(
      //               crossAxisAlignment: CrossAxisAlignment.center,
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: <Widget>[
      //                 SizedBox(width: 5),
      //                 const Icon(
      //                   Icons.favorite,
      //                   color: Colors.red,
      //                   size: 18,
      //                 ),
      //                 SizedBox(width: 5),
      //                 AutoSizeText(
      //                   "Được tạo ra bởi ",
      //                   style: TextStyle(
      //                     fontSize: 15,
      //                     fontFamily: "Montserrat",
      //                     fontWeight: FontWeight.w500,
      //                     color: Colors.black,
      //                   ),
      //                   maxFontSize: 15,
      //                   maxLines: 1,
      //                 ),
      //                 AutoSizeText(
      //                   "Phạm Quang Huy",
      //                   style: TextStyle(
      //                     fontSize: 15,
      //                     fontFamily: "Montserrat",
      //                     fontWeight: FontWeight.w700,
      //                     color: Colors.black,
      //                   ),
      //                   maxFontSize: 15,
      //                   maxLines: 1,
      //                 ),
      //                 SizedBox(width: 5),
      //                 Image(
      //                   height: 18,
      //                   width: 18,
      //                   image: AssetImage("assets/qhuy.png"),
      //                 ),
      //                 SizedBox(width: 5),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}

_launchURL() async {
  const url = 'https://www.facebook.com/QHuyPham.3399';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
