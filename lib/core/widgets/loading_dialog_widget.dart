import 'package:flutter/material.dart';

class LoadingDialogWidget {
  static Future<void> showLoadingDialog(BuildContext context, GlobalKey key,
      [String label = "Please Wait....."]) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
            onWillPop: () async => false,
            child: Container(
              child: SimpleDialog(
                key: key,
                backgroundColor: Colors.black54,
                children: <Widget>[
                  Center(
                    child: Column(children: [
                      SizedBox(
                        height: 25.0,
                        width: 25.0,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          valueColor:
                              new AlwaysStoppedAnimation<Color>(Colors.grey),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        label,
                        style: TextStyle(color: Colors.white70),
                      )
                    ]),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
