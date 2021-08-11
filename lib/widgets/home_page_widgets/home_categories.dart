import 'package:flutter/material.dart';
import 'home_category.dart';
import 'package:auto_size_text/auto_size_text.dart';

// ignore: must_be_immutable
class HomeCategories extends StatelessWidget {
  const HomeCategories();
  static AutoSizeGroup titleGrp = AutoSizeGroup();
  static AutoSizeGroup descGrp = AutoSizeGroup();

  static List<Map<String, dynamic>> categoryData = [
    {
      "imgLeft": 5.0,
      "imgBottom": 19.0,
      "imgHeight": 122.0,
      "imgPath": "assets/stats.png",
      "tabName": "Thống kê",
      "tabDesc": "Xem Covid-19 đang ảnh hưởng đến thế giới như thế nào.",
      "color": Colors.deepPurpleAccent,
    },
    {
      "imgLeft": 10.0,
      "imgBottom": -8.0,
      "imgHeight": 150.0,
      "imgPath": "assets/symptoms/symptoms.png",
      "tabName": "Triệu chứng",
      "tabDesc": "Những triệu chứng thường thấy khi mắc Covid-19.",
      "color": Colors.teal[800],
    },
    {
      "imgPath": "assets/prevention/boy.png",
      "imgHeight": 140.0,
      "imgLeft": 15.0,
      "imgBottom": 0.0,
      "tabName": "Các biện pháp phòng ngừa",
      "tabDesc": "Làm thế nào để không trở thành nạn nhân của Covid-19",
      "color": Colors.lightBlue[700],
    },
    {
      "imgPath": "assets/myths/myths.png",
      "tabName": "Thông tin sai về Covid-19",
      "imgBottom": -30.0,
      "imgLeft": -10.0,
      "imgHeight": 170.0,
      "tabDesc": "Loại bỏ những giả định sai lầm về Covid-19",
      "color": Colors.redAccent[700],
    },
    {
      "imgBottom": 10.0,
      "imgLeft": 3.0,
      "tabName": "Virus Covid-19",
      "imgHeight": 130.0,
      "tabDesc": "Hiểu biết chung về Coronavirut",
      "imgPath": "assets/corona.png",
      "color": Colors.orange[700],
    },
    {
      "imgBottom": 5.0,
      "imgLeft": 0.0,
      "tabName": "Vắc-xin",
      "imgHeight": 130.0,
      "tabDesc": "Tìm hiểu về những vắc-xin Coronavirut hiện nay",
      "imgPath": "assets/vacxincovid.png",
      "color": Colors.purple[700],
    },
    {
      "imgBottom": -4.0,
      "imgLeft": 8.0,
      "imgPath": "assets/document.png",
      "tabName": "Khai báo y tế",
      "imgHeight": 130.0,
      "tabDesc": "Khai báo y tế cá nhân",
      "color": Colors.blueAccent[700],
    },
    {
      "imgBottom": -4.0,
      "imgLeft": 8.0,
      "imgPath": "assets/mapcovid.png",
      "tabName": "Bản đồ Covid-19",
      "imgHeight": 130.0,
      "tabDesc": "Bản đồ Covid-19 tại địa phương",
      "color": Colors.lime[700],
    },
    {
      "imgBottom": -4.0,
      "imgLeft": 8.0,
      "imgPath": "assets/updates/updates.png",
      "tabName": "Thông tin hằng ngày",
      "imgHeight": 146.0,
      "tabDesc": "Xem tin tức mới nhất liên quan đến vi rút",
      "color": Colors.greenAccent[700],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categoryData.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        var cat = categoryData[index];
        return CategoryTab(
          titleGrp: titleGrp,
          descGrp: descGrp,
          imgPath: cat["imgPath"],
          imgBottom: cat["imgBottom"],
          imgHeight: cat["imgHeight"],
          imgLeft: cat["imgLeft"],
          tabDesc: cat["tabDesc"],
          tabName: cat["tabName"],
          color: cat["color"],
        );
      },
    );
  }
}
