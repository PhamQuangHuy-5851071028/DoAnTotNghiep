import 'package:MyCovid19/screens/googlemap.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class healthDeclarationScreen extends StatefulWidget {

  @override
  _healthDeclarationState createState() => _healthDeclarationState();
}

class _healthDeclarationState extends State<healthDeclarationScreen> {
  String dropdownValue = 'Phú Thọ';
  String dropdownValue2 = 'Việt Trì';
  String dropdownValue3 = 'Vân Phú';
  var items = ['Phú Thọ', 'Hồ Chí Minh'];
  var items2 = ['Việt Trì', 'Quận 9'];
  var items3 = ['Vân Phú', 'Tăng Nhơn Phú A'];

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1000, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

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
                        ),
                        SizedBox(height: 20,),
                        AutoSizeText(
                          "Ngày sinh",
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
                        Row(
                          children: [
                            IconButton(
                              onPressed: () => _selectDate(context),
                              icon: Icon(Icons.drive_file_rename_outline),
                            ),
                            AutoSizeText(
                              "${selectedDate.toLocal()}".split(' ')[0],
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Montserrat",
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                              stepGranularity: 1,
                              maxFontSize: 31,
                              maxLines: 2,
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        AutoSizeText(
                          "Nhập quốc tịch",
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
                              prefixIcon: Icon(Icons.flag),
                              hintText: 'Nhập vào quốc tịch'
                          ),
                        ),
                        SizedBox(height: 20,),
                        AutoSizeText(
                          "Chọn tỉnh, thành phố",
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
                        new DropdownButton<String>(
                          hint: Text('Chọn'),
                          value: dropdownValue,
                          icon: const Icon(Icons.arrow_drop_down,),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(
                            color: Colors.black,
                            fontFamily: "Montserrat",
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                          underline: Container(
                            height: 1,
                            color: Colors.black38,
                          ),
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items)
                            );
                          }).toList(),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                            });
                          },
                        ),
                        SizedBox(height: 20,),
                        AutoSizeText(
                          "Chọn quận, huyện",
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
                        new DropdownButton<String>(
                          hint: Text('Chọn'),
                          value: dropdownValue2,
                          icon: const Icon(Icons.arrow_drop_down,),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(
                            color: Colors.black,
                            fontFamily: "Montserrat",
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                          underline: Container(
                            height: 1,
                            color: Colors.black38,
                          ),
                          items: items2.map((String items) {
                            return DropdownMenuItem(
                                value: items,
                                child: Text(items)
                            );
                          }).toList(),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue2 = newValue;
                            });
                          },
                        ),
                        SizedBox(height: 20,),
                        AutoSizeText(
                          "Chọn xã, phường",
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
                        new DropdownButton<String>(
                          hint: Text('Chọn'),
                          value: dropdownValue3,
                          icon: const Icon(Icons.arrow_drop_down,),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(
                            color: Colors.black,
                            fontFamily: "Montserrat",
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                          underline: Container(
                            height: 1,
                            color: Colors.black38,
                          ),
                          items: items3.map((String items) {
                            return DropdownMenuItem(
                                value: items,
                                child: Text(items)
                            );
                          }).toList(),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue3 = newValue;
                            });
                          },
                        ),
                        SizedBox(height: 20,),
                        IconButton(
                          icon: Icon(Icons.map),
                          alignment: Alignment.topLeft ,
                          color: Colors.blue,
                          iconSize: 30,
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => googleMapScreen()),
                            );
                          },
                        ),
                      ]
                  )
          ),
        )
    );
  }
}