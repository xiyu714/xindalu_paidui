import 'dart:async';
/*
  实现： 1.定时更新数据
        2.立即更新数据
        3.停止更新数据
 */
import 'package:flutter/material.dart';
import 'package:paidui_xitong/model/paidui.dart';

class NowPaidui with ChangeNotifier {
  bool stop = false;
  Paidui paidui;

  run() {
    const period = const Duration(seconds: 5);

    Timer.periodic(period, (timer) async {
      if(this.stop) { //stop时取消更新
        timer.cancel();
      } else {
        this.paidui = await Paidui.post();
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