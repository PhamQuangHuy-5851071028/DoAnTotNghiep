import 'package:flutter/material.dart';

class ExitConfirmationDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildChild(context),
    );
  }

  _buildChild(BuildContext context) => Container(
        height: 250,
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(23.0))),
        child: Column(
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  'assets/corona.png',
                  height: 70,
                  width: 70,
                ),
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(23),
                      topRight: Radius.circular(23))),
            ),
            Divider(
              height: 10,
              color: Colors.black,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Thoát ứng dụng?',
              style: TextStyle(
                fontSize: 17,
                color: Colors.indigo[900],
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // ignore: deprecated_member_use
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Không',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo[900]),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),

                TextButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(23.0),
                        side: BorderSide(color: Colors.indigo[900]),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.indigo[900]),
                  ),
                  onPressed: () {
                    return Navigator.of(context).pop(true);
                  },
                  child: Text(
                    'Có',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      );
}
