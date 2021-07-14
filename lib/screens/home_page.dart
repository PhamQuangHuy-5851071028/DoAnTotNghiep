import 'package:MyCovid19/models/chat_bot.dart';
import 'package:MyCovid19/screens/credits_page.dart';
import '../widgets/home_page_widgets/home_categories.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    configOneSignal();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreditsScreen()),
              );
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePageDialogflow()),
                );
              },
              icon: const Icon(
                Icons.chat,
                color: Colors.black,
              ),
            )
          ],
          centerTitle: true,
          title: AutoSizeText(
            "Theo dõi Covid-19",
            style: TextStyle(
              fontSize: 20,
              fontFamily: "Montserrat",
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
            minFontSize: 14,
            stepGranularity: 2,
            maxLines: 1,
          ),
        ),
        body: HomeCategories(),
      ),
    );
  }

  void configOneSignal() async{
    await OneSignal.shared.setAppId('9eec59d4-9b7c-4b7f-9875-74f80bfea3bd');
  }


}
