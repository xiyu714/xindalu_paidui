import 'dart:async';
/*
  实现： 1.定时更新数据
        2.立即更新数据
        3.停止更新数据
 */
import 'package:flutter/material.dart';
import 'package:paidui_xitong/model/paidui.dart';
import 'package:paidui_xitong/page/home.dart';
import 'package:vibration/vibration.dart';

class NowPaidui with ChangeNotifier {
  bool stop = false;
  Paidui paidui;

  run(BuildContext context) {
    const period = const Duration(seconds: 5);

    Timer.periodic(period, (timer) async {
      if(this.stop) { //stop时取消更新
        timer.cancel();
      } else {
        this.paidui = await Paidui.post();
        if(this.paidui.ResultObj.Value <= 3) {
          Vibration.vibrate(duration: 1000);
          showDialog(
              context: context,
              barrierDismissible: true,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("登录错误"),
                  content: Text("hello"),
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  actions: <Widget>[
                    new FlatButton(
                      child: new Text("取消"),
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return Home();
                            }
                        ));
                      },
                    ),
                    new FlatButton(
                      child: new Text("确定"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              }
          );
        }
        notifyListeners();
      }
    });

    run_once();
  }

  run_once() async {
    this.paidui = await Paidui.post();
    notifyListeners();
  }
}