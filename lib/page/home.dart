import 'package:flutter/material.dart';
import 'paidui_history.dart';

class Home extends StatefulWidget {
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("主页"),
        ),
      body: Column(

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
              Container(
                margin: EdgeInsets.all(40),
                child: Column(
                  children: <Widget>[
                    Text("当前排队人数"),

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
      ),
    );
  }
}
