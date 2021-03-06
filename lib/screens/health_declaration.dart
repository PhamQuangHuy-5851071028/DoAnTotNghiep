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
      lastDate: DateTime(2101),
      helpText: 'Chọn ngày sinh', // Can be used as title
      cancelText: 'Hủy',
      confirmText: 'Chọn',
    );
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
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: LayoutBuilder(
            builder: (ctx, constraint) => ListView(
              children: <Widget>[
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
                  textCapitalization: TextCapitalization.characters,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.people),
                      hintText: 'Nhập vào họ tên'),
                ),
                SizedBox(
                  height: 20,
                ),
                AutoSizeText(
                  "Giới tính",
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
                      hintText: 'Nhập vào giới tính'),
                ),
                SizedBox(
                  height: 20,
                ),
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
                SizedBox(
                  height: 20,
                ),
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
                      hintText: 'Nhập vào quốc tịch'),
                ),
                SizedBox(
                  height: 20,
                ),
                AutoSizeText(
                  "Số hộ chiếu / CMND / CCCD",
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
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.book_outlined),
                      hintText: 'Nhập vào đây'),
                ),
                SizedBox(
                  height: 20,
                ),
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
                  icon: const Icon(
                    Icons.arrow_drop_down,
                  ),
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
                    return DropdownMenuItem(value: items, child: Text(items));
                  }).toList(),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
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
                  icon: const Icon(
                    Icons.arrow_drop_down,
                  ),
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
                    return DropdownMenuItem(value: items, child: Text(items));
                  }).toList(),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue2 = newValue;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
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
                  icon: const Icon(
                    Icons.arrow_drop_down,
                  ),
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
                    return DropdownMenuItem(value: items, child: Text(items));
                  }).toList(),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue3 = newValue;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                AutoSizeText(
                  "Số nhà, phố, tổ dân phố/thôn/đội",
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
                    // autofocus: true,
                    ),
                IconButton(
                  icon: Icon(Icons.map),
                  alignment: Alignment.topLeft,
                  color: Colors.blue,
                  iconSize: 30,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => googleMapScreen()),
                    );
                  },
                ),
                AutoSizeText(
                  "Số điện thoại",
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
                  // autofocus: true,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone_android),
                      hintText: 'Nhập số điện thoại'),
                ),
                SizedBox(
                  height: 20,
                ),
                AutoSizeText(
                  "Email",
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
                  // autofocus: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.mail), hintText: 'Nhập vào email'),
                ),
                SizedBox(
                  height: 20,
                ),
                AutoSizeText(
                  "Trong vòng 14 ngày qua Anh/chị có đến quốc gia/vùng lãnh thổ nào (có thể đi qua nhiều quốc gia)",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Montserrat",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                  stepGranularity: 1,
                  maxFontSize: 16,
                  maxLines: 2,
                ),
                TextField(
                  // autofocus: true,
                  keyboardType: TextInputType.emailAddress,
                  maxLines: null,
                  decoration: InputDecoration(),
                ),
                SizedBox(
                  height: 20,
                ),
                AutoSizeText(
                  "Trong vòng 14 ngày qua Anh/chị có xuất hiện dấu hiệu nào sau đây không?",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Montserrat",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                  stepGranularity: 1,
                  maxFontSize: 16,
                  maxLines: 2,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        new Text(
                          "Triệu chứng",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Montserrat",
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        new Text(
                          "Sốt",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Montserrat",
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        new Text(
                          "Ho",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Montserrat",
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        new Text(
                          "Khó thở",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Montserrat",
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        new Text(
                          "Viêm phổi",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Montserrat",
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        new Text(
                          "Đau họng",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Montserrat",
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        new Text(
                          "Mệt mỏi",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Montserrat",
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    new Column(
                      children: [
                        new Text(
                          "Có",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Montserrat",
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    new Column(
                      children: [
                        new Text(
                          "Không",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Montserrat",
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                AutoSizeText(
                  "Trong vòng 14 ngày qua Anh/chị có tiếp xúc với",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Montserrat",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                  stepGranularity: 1,
                  maxFontSize: 16,
                  maxLines: 2,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        new Text(
                          " ",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Montserrat",
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        AutoSizeText(
                          "Có tiếp xúc với trường hợp bệnh"
                          "\nhoặc nghi ngờ mắc bệnh"
                          "\nCOVID-19 không?",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Montserrat",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          stepGranularity: 1,
                          maxFontSize: 16,
                          maxLines: 3,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        AutoSizeText(
                          "Có đi về từ vùng có dịch"
                          "\nCOVID-19 không?",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Montserrat",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          stepGranularity: 1,
                          maxFontSize: 16,
                          maxLines: 3,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        AutoSizeText(
                          "Có tiếp xúc với trường hợp"
                          "\nđi về từ vùng dịch không?",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Montserrat",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          stepGranularity: 1,
                          maxFontSize: 16,
                          maxLines: 3,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        AutoSizeText(
                          "Người có biểu hiện (Sốt, ho,"
                          "\nkhó thở, Viêm phổi)",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Montserrat",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          stepGranularity: 1,
                          maxFontSize: 16,
                          maxLines: 3,
                        ),
                      ],
                    ),
                    new Column(
                      children: [
                        new Text(
                          "Có",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Montserrat",
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    new Column(
                      children: [
                        new Text(
                          "Không",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Montserrat",
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
