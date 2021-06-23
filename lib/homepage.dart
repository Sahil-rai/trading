import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutteranimatedchartsapp/constant.dart';
import 'package:flutteranimatedchartsapp/footer.dart';
import 'package:flutteranimatedchartsapp/link_data.dart';
import 'package:flutteranimatedchartsapp/personal_details.dart';
import 'package:flutteranimatedchartsapp/settings_btn.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  final Widget child;

  HomePage({Key key, this.child}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<charts.Series<Task, String>> _seriesPieData;
  List<charts.Series<Stocks, int>> _seriesLineData;

  final imgUrl =
      'https://images.unsplash.com/flagged/photo-1572976430700-e0412dfacf92?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=753&q=80';

  _generateData() {
    var piedata = [
      new Task('Stock A', 35.8, Color(0xff3366cc)),
      new Task('Stock B', 8.3, Color(0xff990099)),
      new Task('Stock C', 10.8, Color(0xff109618)),
      new Task('Stock D', 15.6, Color(0xfffdbe19)),
      new Task('Stock E', 19.2, Color(0xffff9900)),
      new Task('Stock F', 10.3, Color(0xffdc3912)),
    ];

    var stockA = [
      new Stocks(0, 45),
      new Stocks(1, 56),
      new Stocks(2, 55),
      new Stocks(3, 60),
      new Stocks(4, 61),
      new Stocks(5, 70),
    ];
    var stockB = [
      new Stocks(0, 35),
      new Stocks(1, 46),
      new Stocks(2, 45),
      new Stocks(3, 50),
      new Stocks(4, 51),
      new Stocks(5, 60),
    ];

    var stockC = [
      new Stocks(0, 20),
      new Stocks(1, 24),
      new Stocks(2, 25),
      new Stocks(3, 40),
      new Stocks(4, 45),
      new Stocks(5, 60),
    ];

    _seriesPieData.add(
      charts.Series(
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskvalue,
        colorFn: (Task task, _) =>
            charts.ColorUtil.fromDartColor(task.colorval),
        id: 'Portfolio',
        data: piedata,
        labelAccessorFn: (Task row, _) => '${row.taskvalue}',
      ),
    );

    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff990099)),
        id: 'Stock A',
        data: stockA,
        domainFn: (Stocks stock, _) => stock.yearval,
        measureFn: (Stocks stock, _) => stock.salesval,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff109618)),
        id: 'Stock B',
        data: stockB,
        domainFn: (Stocks stock, _) => stock.yearval,
        measureFn: (Stocks stock, _) => stock.salesval,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xffff9900)),
        id: 'Stock C',
        data: stockC,
        domainFn: (Stocks stock, _) => stock.yearval,
        measureFn: (Stocks stock, _) => stock.salesval,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _seriesPieData = List<charts.Series<Task, String>>();
    _seriesLineData = List<charts.Series<Stocks, int>>();
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff1976d2),
            //backgroundColor: Color(0xff308e1c),
            bottom: TabBar(
              indicatorColor: Color(0xff9962D0),
              tabs: [
                Tab(
                  icon: Icon(FontAwesomeIcons.home),
                ),
                Tab(icon: Icon(FontAwesomeIcons.user)),
                Tab(icon: Icon(FontAwesomeIcons.cog)),
              ],
            ),
            title: Text('Trading App'),
          ),
          body: TabBarView(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: charts.LineChart(_seriesLineData,
                              defaultRenderer: new charts.LineRendererConfig(
                                  includeArea: true, stacked: true),
                              animate: true,
                              animationDuration: Duration(seconds: 5),
                              behaviors: [
                                new charts.ChartTitle('',
                                    behaviorPosition:
                                        charts.BehaviorPosition.bottom,
                                    titleOutsideJustification: charts
                                        .OutsideJustification.middleDrawArea),
                                new charts.ChartTitle('Price',
                                    behaviorPosition:
                                        charts.BehaviorPosition.start,
                                    titleOutsideJustification: charts
                                        .OutsideJustification.middleDrawArea),
                                new charts.ChartTitle(
                                  'Price Action',
                                  behaviorPosition: charts.BehaviorPosition.end,
                                  titleOutsideJustification: charts
                                      .OutsideJustification.middleDrawArea,
                                )
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Portfolio',
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Expanded(
                          child: charts.PieChart(_seriesPieData,
                              animate: true,
                              animationDuration: Duration(seconds: 5),
                              behaviors: [
                                new charts.DatumLegend(
                                  outsideJustification:
                                      charts.OutsideJustification.endDrawArea,
                                  horizontalFirst: false,
                                  desiredMaxRows: 2,
                                  cellPadding: new EdgeInsets.only(
                                      right: 4.0, bottom: 4.0),
                                  entryTextStyle: charts.TextStyleSpec(
                                      color: charts
                                          .MaterialPalette.purple.shadeDefault,
                                      fontFamily: 'Georgia',
                                      fontSize: 11),
                                )
                              ],
                              defaultRenderer: new charts.ArcRendererConfig(
                                  arcWidth: 100,
                                  arcRendererDecorators: [
                                    new charts.ArcLabelDecorator(
                                        labelPosition:
                                            charts.ArcLabelPosition.inside)
                                  ])),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(imgUrl),
                                backgroundColor: Colors.white,
                                radius: 48,
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                '@username',
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              for (var btn in buttonsData)
                                SettingsButton(
                                    btnText: btn.title,
                                    onPressFunc: () {
                                      if (btn.title == 'Personal Details') {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) =>
                                              PersonalDetails(),
                                        ));
                                      } else if (btn.title ==
                                          'Wallet Details') {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                                  title: const Text('Wallet'),
                                                  content: const Text(
                                                      'Balance : 500'),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(context,
                                                              'Cancel'),
                                                      child:
                                                          const Text('Cancel'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              context, 'OK'),
                                                      child: const Text('OK'),
                                                    ),
                                                  ],
                                                ));
                                      }
                                    }),
                              Spacer(),
                              Footer(),
                              SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
