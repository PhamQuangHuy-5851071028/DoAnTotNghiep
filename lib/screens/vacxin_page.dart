import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class VacxinScreen extends StatelessWidget {
  final imgPath;
  final Color color;

  static List<Map<String, String>> details = [
    {
      "detail": "Vắc-xin BIBP (Sinopharm)",
      "desc": 'Vắc-xin BIBP của Sinopharm đã được chứng minh đạt hiệu quả 79%.'
          '\n\n Tác dụng phụ thường gặp nhất:'
          '\n- Đau ở vị trí tiêm'
          '\n- Đau đầu'
          '\nCũng có thể có những tác dụng phụ khác, ít gặp hơn.',
    },
    {
      "detail": "Vắc-xin BioNTech, Pfizer",
      "desc":
          'Vắc-xin của Pfizer-BioNTech, hay BNT162b2, đã được chứng minh đạt hiệu quả 95%.'
              '\n\n Tác dụng phụ thường gặp nhất:'
              '\n- Đau đầu'
              '\n- Đau khớp'
              '\n- Đau cơ'
              '\n- Đau ở vị trí tiêm'
              '\n- Mệt mỏi'
              '\n- Ớn lạnh'
              '\n- Sốt'
              '\n- Sưng ở vị trí tiêm'
              '\nCũng có thể có những tác dụng phụ khác ít gặp hơn.'
              '\nCác tác dụng phụ có thể thường gặp nhiều hơn sau liều thứ hai.',
    },
    {
      "detail": "Vắc-xin Janssen(Johnson & Johnson)",
      "desc":
          'Vắc-xin của Johnson & Johnson, hay Ad26.COV2.S, đã được chứng minh đạt hiệu quả 66,9%'
              '\n\n Tác dụng phụ thường gặp nhất:'
              '\n- Đau hoặc nhức ở vị trí tiêm'
              '\n- Đỏ'
              '\n- Sưng'
              '\n- Sốt'
              '\nCũng có thể có những tác dụng phụ khác, ít gặp hơn.',
    },
    {
      "detail": "Vắc-xin Moderna",
      "desc":
          'Vắc-xin của Moderna, hay mRNA-1273, đã được chứng minh đạt hiệu quả 94,1%'
              '\n\n Tác dụng phụ thường gặp nhất:'
              '\n- Đau, sưng hoặc đỏ ở vị trí tiêm'
              '\n- Mệt mỏi'
              '\n- Đau đầu'
              '\n- Đau cơ hoặc khớp'
              '\n- Ớn lạnh'
              '\n- Buồn nôn và nôn'
              '\n- Sưng dưới cánh tay'
              '\n- Sốt'
              '\nCũng có thể có những tác dụng phụ khác, ít gặp hơn.'
              '\nCác tác dụng phụ có thể thường gặp nhiều hơn sau liều thứ hai.',
    },
    {
      "detail": "Vắc-xin Oxford, AstraZeneca",
      "desc":
          'Vắc-xin của Astrazeneca-Oxford, hay AZD1222, đã được chứng minh đạt hiệu quả 63%'
              '\n\n Tác dụng phụ thường gặp nhất:'
              '\n- Đau hoặc nhức ở vị trí tiêm'
              '\n- Mệt mỏi'
              '\n- Đau đầu'
              '\n- Đau cơ hoặc khớp'
              '\n- Ớn lạnh'
              '\n- Buồn nôn'
              '\nCũng có thể có những tác dụng phụ khác, ít gặp hơn.',
    },
  ];

  static AutoSizeGroup titleGrp = AutoSizeGroup();
  static AutoSizeGroup descGrp = AutoSizeGroup();

  const VacxinScreen({Key key, this.imgPath, this.color}) : super(key: key);

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
                            "Vắc-xin Covid-19",
                            style: TextStyle(
                              color: color,
                              fontFamily: "Montserrat",
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            ),
                            stepGranularity: 2,
                            maxFontSize: 30,
                            maxLines: 2,
                          ),
                        ),
                      ),
                    ),

                    //Image
                    Positioned.fill(
                      right: -20,
                      bottom: -15,
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
                              maxLines: 2,
                              group: titleGrp,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            AutoSizeText(
                              "${details[index]['desc']}",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 18,
                                height: 1.5,
                                fontFamily: "Montserrat",
                                color: Colors.grey[850],
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
