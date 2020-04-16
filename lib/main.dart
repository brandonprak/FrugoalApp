import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<AnimatedCircularChartState> _chartKey =
      new GlobalKey<AnimatedCircularChartState>();

  List<CircularStackEntry> data = <CircularStackEntry>[
    new CircularStackEntry(
      <CircularSegmentEntry>[
        new CircularSegmentEntry(500, Colors.red, rankKey: 'Q1'),
        new CircularSegmentEntry(1000, Colors.green, rankKey: 'Q2'),
        new CircularSegmentEntry(2000, Colors.blue, rankKey: 'Q3'),
        new CircularSegmentEntry(1000, Colors.yellow, rankKey: 'Q4'),
      ],
      rankKey: 'Quarterly Profits',
    ),
  ];

  void _cycleSamples() {
    List<CircularStackEntry> nextData = <CircularStackEntry>[
      new CircularStackEntry(
        <CircularSegmentEntry>[
          new CircularSegmentEntry(500, Colors.red, rankKey: 'Q1'),
          new CircularSegmentEntry(1000, Colors.green, rankKey: 'Q2'),
          new CircularSegmentEntry(2000, Colors.blue, rankKey: 'Q3'),
          new CircularSegmentEntry(1000, Colors.yellow, rankKey: 'Q4'),
        ],
        rankKey: 'Quarterly Profits',
      ),
    ];
    setState(() {
      _chartKey.currentState.updateData(nextData);
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('Home'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              color: Colors.white,
              onPressed: () {},
            ),
          ]),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Card(
            color: Colors.blueGrey,
            child: ListTile(
              leading: Icon(Icons.person, size: 50, color: Colors.white),
              title:
                  Text('Welcome User', style: TextStyle(color: Colors.white)),
              subtitle: Text('Here is your summary',
                  style: TextStyle(color: Colors.white)),
            ),
          ),
          AnimatedCircularChart(
            key: _chartKey,
            size: const Size(300, 300),
            initialChartData: data,
            chartType: CircularChartType.Pie,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ListPage()),
          );
        },
        child: Icon(Icons.android),
      ),
    );
  }
}

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      appBar: AppBar(
        title: Text('Second Page'),
      ),
    );
  }
}
