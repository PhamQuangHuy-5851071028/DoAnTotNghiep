import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class healthDeclarationScreen extends StatefulWidget {

  @override
  _healthDeclarationState createState() => _healthDeclarationState();
}

class _healthDeclarationState extends State<healthDeclarationScreen> {
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
          title: Text("Khai báo y tế",
              style: TextStyle(color: Colors.black, fontSize: 24)),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: LayoutBuilder(
              builder: (ctx, constraint) =>
                  Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(
                          height: 60,
                        ),
                        AutoSizeText(
                          "Họ và tên",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Montserrat",
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                          stepGranularity: 1,
                          maxFontSize: 31,
                          maxLines: 2,
                        ),
                        TextField(
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.people),
                              hintText: 'Nhập vào họ tên'
                          ),
                        )
                      ]
                  )
          ),
        )
    );
  }
}