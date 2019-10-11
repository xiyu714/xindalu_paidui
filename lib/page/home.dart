import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:paidui_xitong/state/now_paidui.dart';
import 'paidui_history.dart';

class Home extends StatefulWidget {
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  NowPaidui paidui = NowPaidui();

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("主页"),
        ),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(builder: (_) {
            paidui.run();
            return paidui;
          },)
        ],
        child: T()
      ),
    );
  }
}

class T extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(

      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(40),
              child: Column(
                children: <Widget>[
                  Text("当前排队人数"),
                  Container(
                    width: 90,
                    height: 90,
                    margin: EdgeInsets.only(top: 20),
                    //alignment: Alignment.center,

                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(
                            style: BorderStyle.solid
                        ),
                        borderRadius: BorderRadius.circular(45),

                      ),
                      child: Center(
                        child: Text('${Provider.of<NowPaidui>(context).paidui?.ResultObj?.Value}'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(40),
              child: Column(
                children: <Widget>[
                  Text("预计等待时间"),
                  Container(
                    width: 90,
                    height: 90,
                    margin: EdgeInsets.only(top: 20),
                    //alignment: Alignment.center,

                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(
                            style: BorderStyle.solid
                        ),
                        borderRadius: BorderRadius.circular(45),

                      ),
                      child: Center(
                        child: Text('re'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          height: 45,
          margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
          child: SizedBox.expand(
            child: OutlineButton(
              child: Text("查看排队最新进展"),
              onPressed: () {},
            ),
          ),
        ),
        Container(
          height: 45,
          margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
          child: SizedBox.expand(
            child: OutlineButton(
              child: Text("查看历史数据"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return SimpleTimeSeriesChart.withSampleData();
                    }
                ));
              },
            ),
          ),
        ),
      ],
    );
  }
}
