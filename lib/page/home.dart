import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:paidui_xitong/state/now_paidui.dart';
import 'package:paidui_xitong/page/paidui_history.dart';
import 'package:paidui_xitong/model/lock.dart';

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
            paidui.run(context);
            return paidui;
          },)
        ],
        child: T()
      ),
    );
  }
}

// 我想在这里放是否禁用
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
                        child: Text('${(Provider.of<NowPaidui>(context).paidui?.ResultObj?.Value??0)*2}'),
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
              onPressed: () {
                Provider.of<NowPaidui>(context).run_once();
              },
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
                      return Paidui_history();
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

class SwitchAndCheckBoxTestRoute extends StatefulWidget {
  @override
  _SwitchAndCheckBoxTestRouteState createState() => new _SwitchAndCheckBoxTestRouteState();
}

class _SwitchAndCheckBoxTestRouteState extends State<SwitchAndCheckBoxTestRoute> {
  bool _switchSelected=true; //维护单选开关状态
  bool _checkboxSelected=true;//维护复选框状态
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Switch(
          value: _switchSelected,//当前状态
          onChanged:(value){
            //重新构建页面
            setState(() {
              if(value == true) {
                Lock.open();
              } else {
                Lock.close();
              }
              _switchSelected=value;
            });
          },
        ),
        Checkbox(
          value: _checkboxSelected,
          activeColor: Colors.red, //选中时的颜色
          onChanged:(value){

            setState(() {
              _checkboxSelected=value;
            });
          } ,
        )
      ],
    );
  }
}

class Fasong extends StatelessWidget {
  Widget build(BuildContext context) {
    return TextField(

    );
  }
}
