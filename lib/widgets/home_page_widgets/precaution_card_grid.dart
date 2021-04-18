import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class PrecautionCardGrid extends StatefulWidget {
  @override
  _PrecautionCardGridState createState() => _PrecautionCardGridState();
}

class _PrecautionCardGridState extends State<PrecautionCardGrid> {
  int selectedIndex=0;
  final List<Map<String, String>> preventions = const [
    {
      "prevention": "Đeo khẩu trang",
      "desc":
      "Luôn nhớ đeo khẩu trang khi bước ra ngoài.",
      "imgPath": "assets/prevention/mask.png",
    },
    {
      "prevention": "Rửa tay",
      "desc": "Rửa tay thường xuyên bằng xà phòng và nước ít nhất là trong 20 giây.",
      "imgPath": "assets/prevention/wash.png",
    },
    {
      "prevention": "Che miệng khi ho",
      "desc": "Ho, hắt hơi vào khuỷu tay hoặc che miệng bằng khăn ăn dùng một lần.",
      "imgPath": "assets/prevention/coughCover.png",
    },
    {
      "prevention": "Vệ sinh thường xuyên",
      "desc": "Sử dụng chất khử trùng có cồn nếu không có nước và xà phòng.",
      "imgPath": "assets/prevention/sanitizer.png",
    },
    {
      "prevention": "Không chạm tay lên mặt",
      "desc": "Không chạm vào mắt, mũi hoặc miệng của bạn thường xuyên khi tay chưa rửa sạch.",
      "imgPath": "assets/prevention/touch.png",
    },
    {
      "prevention": "Hạn chế tiếp xúc xã hội",
      "desc": "Giữ khoảng cách 2m với người khác. Ở nhà và tránh tụ tập đông người.",
      "imgPath": "assets/prevention/socialDistance.png",
    },
    {
      "prevention": "Tập thể dục",
      "desc": "Tập thể dục thường xuyên để đảm bảo sức khỏe cá nhân.",
      "imgPath": "assets/prevention/doEx.png",
    },
    {
      "prevention": "Ăn uống đầu đủ chất",
      "desc": "Ăn những đồ ăn tốt cho sức khỏe và cho hệ miễn dịch, ăn đủ bữa, đủ thành phần.",
      "imgPath": "assets/prevention/eatHealthy.png",
    },
  ];

  static AutoSizeGroup titleGrp=AutoSizeGroup();
  static AutoSizeGroup descGrp=AutoSizeGroup();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.0,
      child: GridView.builder(
        physics: BouncingScrollPhysics(),
        padding:
        const EdgeInsets.symmetric(horizontal: 14.0, vertical: 20.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 15.0,
          crossAxisCount: 2,
          childAspectRatio: 0.70,
        ),
        scrollDirection: Axis.vertical,
        itemCount: preventions.length,
        itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              setState(() {
                selectedIndex=index;
              });
            },
            child: Material(
              borderRadius: BorderRadius.circular(15.0),
              elevation: 5,
              child: AnimatedContainer(
                curve: Curves.fastOutSlowIn,
                duration: Duration(milliseconds: 650),
                decoration: BoxDecoration(
                  color: index==selectedIndex? Colors.teal[50]:Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                padding: const EdgeInsets.fromLTRB(14, 20, 14, 0),
                child: LayoutBuilder(
                  builder: (ctx, constraint) => Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Image(
                        image: AssetImage(preventions[index]["imgPath"]),
                        height: constraint.maxHeight * 0.46,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      LimitedBox(
                        maxHeight: constraint.maxHeight * 0.1,
                        child: AutoSizeText(
                          "${preventions[index]["prevention"]}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Montserrat",
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                          ),
                          maxFontSize: 16,
                          maxLines: 1,
                          minFontSize: 11,
                          stepGranularity: 1,
                          group: titleGrp,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      LimitedBox(
                        maxHeight: constraint.maxHeight*0.30,
                        child: AutoSizeText(
                          "${preventions[index]['desc']}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: "Montserrat",
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                          maxFontSize: 12,
                          minFontSize: 9,
                          group: descGrp,
                          stepGranularity: 1,
                          maxLines: 4,
                        ),
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
