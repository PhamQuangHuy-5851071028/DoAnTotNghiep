import 'package:MyCovid19/widgets/stats_widgets/timeline_covid.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AffectedAreasContainer extends StatelessWidget {
  const AffectedAreasContainer();

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 3, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //Affected Areas Text
                  Expanded(
                    flex: 5,
                    child: AutoSizeText(
                      "Các vùng bị ảnh hưởng",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 17,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      maxFontSize: 17,
                    ),
                  ),
                  // More horiz icon
                  Expanded(
                    child: IconButton(
                      icon: AutoSizeText(
                        "Xem thêm",
                        style: TextStyle(
                          color: Colors.red,
                          fontFamily: "Montserrat",
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                        maxFontSize: 16,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                      // icon: const Icon(
                      //   Icons.more_horiz,
                      //   color: Colors.red,
                      //   size: 35,
                      // ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => timelineCovidScreen()),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
              child: Image(
                image: AssetImage("assets/stats/map.png"),
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
