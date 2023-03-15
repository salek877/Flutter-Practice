import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExitPopUpService extends StatelessWidget {
  final page;
  ExitPopUpService(this.page);
  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPop() async {
      return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Alert!"),
              content: Text("Do you want to exit?"),
              actions: <Widget>[
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: Text("Cancel")),
                ElevatedButton(
                    onPressed: () {
                      if (Platform.isIOS) {
                        exit(0);
                      } else {
                        SystemNavigator.pop();
                      }
                    },
                    child: Text("Yes")),
              ],
            );
          });
    }

    return WillPopScope(child: page, onWillPop: showExitPop);
  }
}

class DialogShowService {
  showExitPop(context) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Alert!"),
            content: Text("Do you want to exit?"),
            actions: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: Text("Cancel")),
              ElevatedButton(
                  onPressed: () {
                    if (Platform.isIOS) {
                      exit(0);
                    } else {
                      SystemNavigator.pop();
                    }
                  },
                  child: Text("Yes")),
            ],
          );
        });
  }
}
