import 'dart:async';
/*
  实现： 1.定时更新数据
        2.立即更新数据
        3.停止更新数据
 */
import 'package:flutter/material.dart';
import 'package:paidui_xitong/global.dart';
import 'package:paidui_xitong/model/paidui.dart';
import 'package:paidui_xitong/page/home.dart';
import 'package:vibration/vibration.dart';

class NowPaidui with ChangeNotifier {
  Paidui paidui;

  run(BuildContext context) {
    const period = const Duration(seconds: 5);

    Timer.periodic(period, (timer) async {
      if(home_stop) { //stop时取消更新
        timer.cancel();
      } else {
        this.paidui = await Paidui.post();
        if(this.paidui.ResultObj.Value <= 3 && paidui_tip) {
          Vibration.vibrate(duration: 1000);
          timer.cancel(); // 在这里终止是有问题的
          showDialog(
              context: context,
              barrierDismissible: true,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("提示"),
                  content: Text("前面仅剩${this.paidui.ResultObj.Value}人，请立即到现场等待办理业务"),
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  actions: <Widget>[
                    new FlatButton(
                      child: new Text("取消提醒"),
                      onPressed: () {
                        paidui_tip = false;
                        Navigator.of(context).pop();
                      },
                    ),
                    new FlatButton(
                      child: new Text("放弃排队"),
                      onPressed: () {
                        home_stop = true;
                        timer.cancel(); // 由于又到home页面，就会又启动一个新的timer
                        Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return Home();
                            }
                        ));
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