/// Timeseries chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:paidui_xitong/model/paidui.dart' as model_paidui;
import 'package:flutter/material.dart';

class Paidui_history extends StatelessWidget {
  model_paidui.Paidui_history history;

  init_async() async {
    history = await model_paidui.Paidui_history.post();
  }

  getData() async* {
    while(true){
      yield await init_async();
      await Future.delayed(Duration(seconds: 1));
    }
  }
  Widget build(BuildContext context) {
    final data = [
      new TimeSeriesSales(DateTime.parse("2012-02-27 13:27:00"), 5),
      new TimeSeriesSales(DateTime.parse("2012-02-27 13:28:00"), 25),
      new TimeSeriesSales(DateTime.parse("2012-02-27 13:29:00"), 25),
      new TimeSeriesSales(DateTime.parse("2012-02-27 13:30:00"), 100),
//    new TimeSeriesSales(DateTime.parse("2012-02-27 13:27:00"), 100),
//    new TimeSeriesSales(DateTime.parse("2012-02-27 13:27:00"), 75),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("历史数据"),
      ) ,
      body: StreamBuilder(
        stream: this.getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
            var data = this.history.ResultObj.PointDTO.map((pointdata) {
              //print("${pointdata.RecordTime}   ${pointdata.Value}");
              return TimeSeriesSales(DateTime.parse(pointdata.RecordTime), pointdata.Value);
            }).toList();
            return SimpleTimeSeriesChart.test(get_Series(data));
          } else {
            return Text("正在加载中");
          }
        },
      )
      //body: SimpleTimeSeriesChart.test(get_Series(data)),
    );
  }
}

class SimpleTimeSeriesChart extends StatelessWidget {
  final List<charts.Series> seriesList;   // 显示数据
  final bool animate;

  SimpleTimeSeriesChart(this.seriesList, {this.animate});

  /// Creates a [TimeSeriesChart] with sample data and no transition.
  factory SimpleTimeSeriesChart.withSampleData() {
    return new SimpleTimeSeriesChart(
      _createSampleData(),  //
      // Disable animations for image tests.
      animate: false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return new charts.TimeSeriesChart(  // 创建一个TimeSeriesChart
      seriesList,   // 需要一个charts.Series类型的列表
      animate: animate,
      // Optionally pass in a [DateTimeFactory] used by the chart. The factory
      // should create the same type of [DateTime] as the data provided. If none
      // specified, the default creates local date time.
      dateTimeFactory: const charts.LocalDateTimeFactory(),
    );
  }

  /// 创建一系列测试用的数据
  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
    final data = [
      new TimeSeriesSales(new DateTime(2017, 9, 19), 5),
      new TimeSeriesSales(new DateTime(2017, 9, 26), 25),
      new TimeSeriesSales(new DateTime(2017, 10, 3), 100),
      new TimeSeriesSales(new DateTime(2017, 10, 10), 75),
    ];

    return [
      new charts.Series<TimeSeriesSales, DateTime>( //timeSeries还是一个数据的封装，
        // 内部有一个列表，封装真正的数据，
        // 然后通过domainFn读取主轴
        // 通过measureFn读取值
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }

  static SimpleTimeSeriesChart test(List<charts.Series<TimeSeriesSales, DateTime>> data) {
    return new SimpleTimeSeriesChart(
      data,  //
      // Disable animations for image tests.
      animate: false,
    );
  }
}

/// Sample time series data type.
class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}

get_Series(List<TimeSeriesSales> data) {
  return [
    new charts.Series<TimeSeriesSales, DateTime>( //timeSeries还是一个数据的封装，
      // 内部有一个列表，封装真正的数据，
      // 然后通过domainFn读取主轴
      // 通过measureFn读取值
      id: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (TimeSeriesSales sales, _) => sales.time,
      measureFn: (TimeSeriesSales sales, _) => sales.sales,
      data: data,
    )
  ];
}