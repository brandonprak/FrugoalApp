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
        new CircularSegmentEntry(3300, Colors.red, rankKey: 'Q1'),
        new CircularSegmentEntry(195, Colors.green, rankKey: 'Q2'),
        new CircularSegmentEntry(60, Colors.blue, rankKey: 'Q3'),
        new CircularSegmentEntry(45, Colors.yellow, rankKey: 'Q4'),
        new CircularSegmentEntry(30, Colors.purple, rankKey: 'Q5'),
      ],
      rankKey: 'Quarterly Profits',
    ),
  ];

  void _cycleSamples() {
    List<CircularStackEntry> nextData = <CircularStackEntry>[
      new CircularStackEntry(
        <CircularSegmentEntry>[
          new CircularSegmentEntry(3300, Colors.red, rankKey: 'Q1'),
          new CircularSegmentEntry(195, Colors.green, rankKey: 'Q2'),
          new CircularSegmentEntry(60, Colors.blue, rankKey: 'Q3'),
          new CircularSegmentEntry(45, Colors.yellow, rankKey: 'Q4'),
          new CircularSegmentEntry(30, Colors.purple, rankKey: 'Q5'),
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
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
          elevation: 0.0,
          title: Text('Home'),
          backgroundColor: Colors.blueGrey[900],
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
            elevation: 5.0,
            margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            color: Colors.blueGrey[700],
            child: ListTile(
              leading: Icon(Icons.person, size: 52, color: Colors.white),
              title: Text('Welcome User',
                  style: TextStyle(fontSize: 18, color: Colors.white)),
              subtitle: Text('Here is your budget at a glance',
                  style: TextStyle(fontSize: 14, color: Colors.white)),
            ),
          ),
          AnimatedCircularChart(
            key: _chartKey,
            size: const Size(350, 350),
            initialChartData: data,
            chartType: CircularChartType.Pie,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 5.0,
        backgroundColor: Colors.blueGrey[700],
        icon: Icon(Icons.list),
        label: Text('Categories'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ListPage()),
          );
        },
      ),
    );
  }
}

class ListPage extends StatelessWidget {
  final category = [
    'Education',
    'Food',
    'Transportation',
    'Entertainment',
    'Other'
  ];
  final icon = [
    Icons.book,
    Icons.fastfood,
    Icons.directions_car,
    Icons.local_movies,
    Icons.more_horiz
  ];
  final categoryColor = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Categories'),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: ListView.builder(
        itemCount: this.category.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5.0,
            margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            color: Colors.blueGrey[700],
            child: ListTile(
                leading: Icon(icon[index], color: categoryColor[index]),
                trailing: Icon(Icons.keyboard_arrow_right,
                    size: 20.0, color: Colors.white),
                title: Text(
                  category[index],
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
                onTap: () {
                  if (category[index] == 'Education') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EducationPage()),
                    );
                  } else if (category[index] == 'Food') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FoodPage()),
                    );
                  } else if (category[index] == 'Transportation') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TransportationPage()),
                    );
                  } else if (category[index] == 'Entertainment') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EntertainmentPage()),
                    );
                  } else if (category[index] == 'Other') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OtherPage()),
                    );
                  }
                }),
          );
        },
      ),
    );
  }
}

class EducationPage extends StatefulWidget {
  @override
  _EducationPageState createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          elevation: 0.0,
          title: Text('Education'),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: ListView(children: <Widget>[
          ListTile(
            title: Text('Tuition Fees', style: TextStyle(color: Colors.white)),
            subtitle: Text('\$3000', style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            title: Text('Calculus Textbook',
                style: TextStyle(color: Colors.white)),
            subtitle: Text('\$200', style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            title:
                Text('History Textbook', style: TextStyle(color: Colors.white)),
            subtitle: Text('\$100', style: TextStyle(color: Colors.white)),
          ),
        ]),
        floatingActionButton: FloatingActionButton.extended(
          elevation: 5.0,
          backgroundColor: Colors.blueGrey[700],
          icon: Icon(Icons.control_point),
          label: Text('Add'),
          onPressed: () {
            print('Test');
          },
        ));
  }
}

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          elevation: 0.0,
          title: Text('Food'),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: ListView(children: <Widget>[
          ListTile(
            title: Text('Groceries', style: TextStyle(color: Colors.white)),
            subtitle: Text('\$150', style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            title: Text('Cheesecake Factory',
                style: TextStyle(color: Colors.white)),
            subtitle: Text('\$40', style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            title:
                Text('Afters Ice Cream', style: TextStyle(color: Colors.white)),
            subtitle: Text('\$5', style: TextStyle(color: Colors.white)),
          ),
        ]),
        floatingActionButton: FloatingActionButton.extended(
          elevation: 5.0,
          backgroundColor: Colors.blueGrey[700],
          icon: Icon(Icons.control_point),
          label: Text('Add'),
          onPressed: () {
            print('Test');
          },
        ));
  }
}

class TransportationPage extends StatefulWidget {
  @override
  _TransportationPageState createState() => _TransportationPageState();
}

class _TransportationPageState extends State<TransportationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          elevation: 0.0,
          title: Text('Transportation'),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: ListView(children: <Widget>[
          ListTile(
            title: Text('Gas', style: TextStyle(color: Colors.white)),
            subtitle: Text('\$40', style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            title: Text('Uber', style: TextStyle(color: Colors.white)),
            subtitle: Text('\$20', style: TextStyle(color: Colors.white)),
          ),
        ]),
        floatingActionButton: FloatingActionButton.extended(
          elevation: 5.0,
          backgroundColor: Colors.blueGrey[700],
          icon: Icon(Icons.control_point),
          label: Text('Add'),
          onPressed: () {
            print('Test');
          },
        ));
  }
}

class EntertainmentPage extends StatefulWidget {
  @override
  _EntertainmentPageState createState() => _EntertainmentPageState();
}

class _EntertainmentPageState extends State<EntertainmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          elevation: 0.0,
          title: Text('Entertainment'),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: ListView(children: <Widget>[
          ListTile(
            title: Text('Netflix', style: TextStyle(color: Colors.white)),
            subtitle: Text('\$13', style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            title: Text('Spotify', style: TextStyle(color: Colors.white)),
            subtitle: Text('\$12', style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            title: Text('Movie', style: TextStyle(color: Colors.white)),
            subtitle: Text('\$12', style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            title: Text('Art Museum', style: TextStyle(color: Colors.white)),
            subtitle: Text('\$8', style: TextStyle(color: Colors.white)),
          ),
        ]),
        floatingActionButton: FloatingActionButton.extended(
          elevation: 5.0,
          backgroundColor: Colors.blueGrey[700],
          icon: Icon(Icons.control_point),
          label: Text('Add'),
          onPressed: () {
            print('Test');
          },
        ));
  }
}

class OtherPage extends StatefulWidget {
  @override
  _OtherPageState createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          elevation: 0.0,
          title: Text('Other'),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: ListView(children: <Widget>[
          ListTile(
            title: Text('Clothes', style: TextStyle(color: Colors.white)),
            subtitle: Text('\$30', style: TextStyle(color: Colors.white)),
          ),
        ]),
        floatingActionButton: FloatingActionButton.extended(
          elevation: 5.0,
          backgroundColor: Colors.blueGrey[700],
          icon: Icon(Icons.control_point),
          label: Text('Add'),
          onPressed: () {
            print('Test');
          },
        ));
  }
}
