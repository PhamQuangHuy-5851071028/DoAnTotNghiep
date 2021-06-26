import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class VirusDetailsScreen extends StatelessWidget {
  final imgPath;
  final Color color;

  static List<Map<String, String>> details = [
    {
      "detail": "Tóm tắt về Covid-19",
      "desc":
          "Coronavirus (còn được gọi là virus corona hay siêu vi corona) "
            "là một nhóm gồm các loại virus thuộc phân họ Coronavirinae trong Họ Coronaviridae, theo Bộ Nidovirales. "
              "Coronavirus gây bệnh ở các loài động vật có vú, bao gồm cả con người và chim. "
                "Ở người, virus gây nhiễm trùng đường hô hấp thường là nhẹ nhưng trong trường hợp ít gặp có thể gây tử vong. "
                  "Coronavirus là virus bao bọc với hệ gen ARN sợi đơn chiều dương và với một nucleocapsid đối xứng xoắn ốc. "
                    "Kích thước bộ gen của coronavirus khoảng từ 26 đến 32 kilo base pair, lớn nhất đối với virus RNA.",
    },
    {
      "detail": "Nguồn gốc",
      "desc": "Virus được cho là bắt nguồn từ cuối năm 2019 trong một chợ thực phẩm" +
          " ở thành phố Vũ Hán, Trung Quốc đã buôn bán trái phép động vật hoang dã. Các chuyên gia sức khỏe " +
          " cho rằng nó có thể bắt nguồn từ loài dơi và sau đó được truyền sang người " +
    "có thể thông qua một loài động vật khác. \n \nCũng có báo cáo rằng dấu " +
        "vật chủ trung gian có thể là tê tê.",
    },
    {
      "detail": "Mức độ nguy hiểm của nó như thế nào?",
      "desc": "Nhiễm coronavirus có một số triệu chứng, bao gồm cả sốt, " +
          "ho, hụt hơi và khó thở. \n \nKhông rõ mức độ gây tử vong " +
          "vi-rút mới. Mặc dù các trường hợp nghiêm trọng có thể gây viêm phổi và tử vong, nhưng có thể " +
          "nhiều trường hợp bệnh nhẹ hơn không bị phát hiện. Nhiều người trong số những người đã chết đã mắc phải " +
          "điều kiện y tế trước đó hoặc người già với hệ thống miễn dịch suy yếu.",
    },
    {
      "detail": "Nó được lây lan như thế nào?",
      "desc": "Loại coronavirus mới có thể lây truyền từ người sang người, mặc dù nó là " +
          "không rõ điều đó xảy ra dễ dàng như thế nào. \n \nViệc truyền xảy ra rất có thể khi tiếp xúc gần gũi " +
          "với người bị nhiễm qua các hạt trong không khí do ho hoặc hắt hơi, hoặc bởi " +
          "ai đó chạm vào người bị nhiễm hoặc vật có vi-rút trên đó và sau đó chạm vào " +
          "miệng, mũi hoặc mắt của họ.",
    },
    {
      "detail": "Có vắc xin nào cho coronavirus không?",
      "desc": "Cho đến nay, không có loại thuốc cụ thể nào được khuyến nghị để ngăn ngừa hoặc điều trị loại coronavirus mới. " +
          "Tuy nhiên, những người bị nhiễm vi rút nên được chăm sóc thích hợp để thuyên giảm " +
          "và điều trị các triệu chứng \n \nMột số phương pháp điều trị cụ thể đang được điều tra và sẽ được kiểm tra thông qua " +
          "thử nghiệm lâm sàng. Một số bác sĩ đang thử một loại thuốc chống vi-rút và cúm mạnh " +
          "thuốc để điều trị những người bị nhiễm bệnh, nhưng khoa học không thể kết luận được liệu chúng " +
          "có hiệu quả.",
    },
    {
      "detail": "Có 2 biến thể mới của Covid-19 là biến thể nào?",
      "desc": "Biến thể Anh chủng B.1.1.7 xuất hiện tại Anh vào tháng 12-2020 được cho là có khả năng lây lan nhanh hơn so với các chủng SARS-CoV-2 trước đây. Đây là biến chủng đang gây nên sự bùng phát mạnh của đại dịch COVID-19 ở Anh cũng như các nước châu Âu. Chủng B.1.1.7 có khả năng lây nhiễm lớn, tải lượng virus tăng gấp bốn lần so với chủng trước đây. Thời gian đào thải mầm bệnh ra ngoài cũng rất cao và rất ngắn, tỷ lệ lây nhiễm tăng 70% so với chủng cũ."
          +   "\n \nCòn biến thể phát hiện ở Nam Phi - B.1.351 - có tốc độ lây nhiễm nhanh hơn 20-200% so với chủng ban đầu, là chủng có tốc độ lây lan mạnh nhất hiện nay. Biến thể này có một số điểm tương đồng với biến thể lần đầu tiên được xác định ở Anh và dường như cũng dễ lây lan hơn, nhưng không có bằng chứng cho thấy gây chết người nhiều hơn.",
    },
  ];

  static AutoSizeGroup titleGrp = AutoSizeGroup();
  static AutoSizeGroup descGrp = AutoSizeGroup();

  const VirusDetailsScreen({Key key, this.imgPath, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double pageHeight = MediaQuery.of(context).size.height;
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
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        height: pageHeight,
        child: Column(
          children: <Widget>[
            //image tag container
            Container(
              height: 220,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0),
                  ),
                  color: color.withOpacity(0.2)),
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
                          width: constraint.maxWidth * 0.55,
                          child: AutoSizeText(
                            "SARS-CoV-2",
                            style: TextStyle(
                              color: color,
                              fontFamily: "Montserrat",
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            ),
                            stepGranularity: 2,
                            maxFontSize: 30,
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ),

                    //Image
                    Positioned.fill(
                      right: -90,
                      bottom: -30,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: LayoutBuilder(
                          builder: (ctx, constraint) => Hero(
                              tag: imgPath,
                              child: Image(
                                image: AssetImage(imgPath),
                                height: constraint.maxHeight * 0.92,
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //Details List
            Container(
              height: pageHeight - 220,
              padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: const EdgeInsets.all(0),
                scrollDirection: Axis.vertical,
                itemCount: details.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: LayoutBuilder(
                      builder: (ctx, constraint) => LimitedBox(
                        maxWidth: constraint.maxWidth,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            AutoSizeText(
                              "${details[index]["detail"]}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 28,
                                fontFamily: "Montserrat",
                                color: color,
                                fontWeight: FontWeight.w700,
                              ),
                              maxFontSize: 28,
                              stepGranularity: 2,
                              maxLines: 3,
                              group: titleGrp,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            AutoSizeText(
                              "${details[index]['desc']}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 18,
                                height: 1.5,
                                fontFamily: "Montserrat",
                                color: Colors.grey[850],
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w500,
                              ),
                              maxFontSize: 18,
                              group: descGrp,
                              stepGranularity: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
