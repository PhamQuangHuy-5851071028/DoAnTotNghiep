import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class MythsScreen extends StatelessWidget {
  final controller = PageController(
    initialPage: 0,
  );

  final imgPath;

  final Color color;

  List<Map<String, String>> myths = [
    {
      "myth": "Bệnh SARS-CoV-2 KHÔNG THỂ lây qua muỗi đốt",
      "desc": "Đó là một loại vi rút đường hô hấp lây lan chủ yếu " +
          "qua các giọt ho hoặc hắt hơi của một người bị nhiễm bệnh," +
          " nước bọt hoặc chảy ra từ mũi.",
      "imgPath": "assets/myths/mosquito.png",
    },
    {
      "myth":
          "Vi rút COVID-19 có thể lây truyền ở những vùng có khí hậu nóng ẩm",
      "desc": "Không có lý do gì để tin rằng thời tiết nóng có thể giết chết loại coronavirus mới" +
          " hoặc các bệnh khác. Nó có thể được truyền trong bất kỳ khí hậu nào.",
      "imgPath": "assets/myths/hot.png",
    },
    {
      "myth": "Tỏi KHÔNG bảo vệ chống lại sự lây nhiễm từ coronavirus",
      "desc": "Tỏi có thể có một số đặc tính chống vi khuẩn. " +
          "Tuy nhiên, không có bằng chứng nào cho thấy tỏi" +
          " có thể bảo vệ mọi người chống lại vi rút COVID-19.",
      "imgPath": "assets/myths/garlic.png",
    },
    {
      "myth": "Thuốc kháng sinh KHÔNG hoạt động chống lại vi rút, chỉ vi khuẩn",
      "desc": "Coronavirus mới (2019-nCoV) là một loại virus và do đó," +
          " thuốc kháng sinh không nên được sử dụng như một phương tiện phòng ngừa hoặc điều trị.",
      "imgPath": "assets/myths/antibiotics.png",
    },
    {
      "myth": "Các bưu kiện từ Trung Quốc KHÔNG THỂ lây lan coronavirus",
      "desc":
          "Các nhà khoa học tin rằng virus không thể tồn tại trên các lá thư hoặc gói hàng " +
              "trong một khoảng thời gian dài. Có rất ít " +
              "rủi ro lây lan từ các sản phẩm hoặc gói hàng được vận chuyển.",
      "imgPath": "assets/myths/package.png",
    },
    {
      "myth": "Chó và mèo KHÔNG lây lan coronavirus",
      "desc":
          "Hiện tại, có rất ít bằng chứng cho thấy SARS-CoV-2 có thể lây nhiễm qua " +
              "mèo và chó. Các nhà khoa học vẫn đang tranh luận " +
              "tầm quan trọng của trường hợp này đối với sự bùng phát.",
      "imgPath": "assets/myths/dogs.png",
    },
    {
      "myth": "Tất cả các nhóm tuổi đều CÓ THỂ lây nhiễm SARS-CoV-2",
      "desc": "Nó có thể lây nhiễm cho mọi người ở mọi lứa tuổi, kể cả trẻ em. " +
          "Tuy nhiên, người lớn tuổi và những người có tình trạng sức khỏe yếu trước đó" +
          " có nhiều khả năng bị bệnh nặng.",
      "imgPath": "assets/myths/ages.png",
    },
  ];

  MythsScreen({Key key, this.imgPath, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back,
              color: color,
              size: 28,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          //Cover Image Container
          Container(
            height: 230,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25.0),
                bottomRight: Radius.circular(25.0),
              ),
              color: color.withOpacity(0.2),
            ),
            width: MediaQuery.of(context).size.width,
            child: LayoutBuilder(
              builder: (ctx, constraint) => Stack(
                children: <Widget>[
                  //Title
                  Positioned(
                    top: constraint.maxHeight * 0.45,
                    left: 20,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: constraint.maxWidth * 0.5,
                        child: AutoSizeText(
                          "Thông tin sai về Covid-19",
                          style: TextStyle(
                            color: color,
                            fontFamily: "Montserrat",
                            fontSize: 31,
                            fontWeight: FontWeight.w700,
                          ),
                          stepGranularity: 1,
                          maxFontSize: 31,
                          maxLines: 2,
                        ),
                      ),
                    ),
                  ),

                  //Image
                  Positioned.fill(
                    right: -27.0,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        padding: const EdgeInsets.only(right: 0.0),
                        child: LayoutBuilder(
                          builder: (ctx, constraint) => Hero(
                            tag: imgPath,
                            child: Image(
                              image: AssetImage(imgPath),
                              height: constraint.maxHeight * 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //Myth card
          Flexible(
            fit: FlexFit.loose,
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 15),
              width: MediaQuery.of(context).size.width > 360.0
                  ? MediaQuery.of(context).size.width - 31.0
                  : MediaQuery.of(context).size.width,
              child: Material(
                borderRadius: BorderRadius.circular(15.0),
                elevation: 5,
                child: Column(
                  children: <Widget>[
                    //Details
                    Flexible(
                      fit: FlexFit.loose,
                      child: PageView.builder(
                          controller: controller,
                          physics: BouncingScrollPhysics(),
                          itemCount: myths.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.fromLTRB(23, 35, 23, 15),
                              child: LayoutBuilder(
                                builder: (ctx, constraint) => Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    LimitedBox(
                                      maxHeight: constraint.maxHeight * 0.27,
                                      child: Image(
                                        image: AssetImage(
                                            "${myths[index]["imgPath"]}"),
                                        height: 100.0,
                                      ),
                                    ),
                                    SizedBox(
                                      height: constraint.maxHeight * 0.11,
                                    ),
                                    LimitedBox(
                                      maxHeight: constraint.maxHeight * 0.17,
                                      child: AutoSizeText(
                                        "${myths[index]["myth"]}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 19,
                                          height: 1.1,
                                          fontFamily: "Montserrat",
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        maxFontSize: 20,
                                        stepGranularity: 2,
                                        maxLines: 3,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 13,
                                    ),
                                    LimitedBox(
                                      maxHeight: constraint.maxHeight * 0.45,
                                      child: AutoSizeText(
                                        "${myths[index]['desc']}",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          fontSize: 16.5,
                                          height: 1.4,
                                          fontFamily: "Montserrat",
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        maxFontSize: 16.5,
                                        stepGranularity: 1.5,
                                        maxLines: 6,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),

                    //Dot Indicator
                    Container(
                      margin: const EdgeInsets.only(bottom: 25),
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: myths.length,
                        effect: WormEffect(
                            dotHeight: 11,
                            dotWidth: 11,
                            spacing: 12.0,
                            strokeWidth: 1.2,
                            dotColor: Colors.grey[400],
                            paintStyle: PaintingStyle.stroke,
                            activeDotColor: Colors.redAccent[700]),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
