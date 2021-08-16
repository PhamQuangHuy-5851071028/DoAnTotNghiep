import 'package:MyCovid19/screens/covid_chart.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WorldStatsImage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Material(
        elevation: 6,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16)),
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
          child: Container(
            child: CovidChart(),
          ),
        ),
      ),
    );
  }
}
