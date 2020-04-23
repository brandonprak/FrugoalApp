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
              title: Text('Welcome to Frugoal',
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
  final List<String> educationItems = <String>[
    'Tuition',
    'Textbooks',
    'Lab Equipment'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          elevation: 0.0,
          title: Text('Education'),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: ListView.builder(
          itemCount: educationItems.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 3.0,
              margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
              color: Colors.blueGrey[700],
              child: ListTile(
                title: Text(
                  '${educationItems[index]}',
                  style: TextStyle(fontSize: 15.0, color: Colors.white),
                ),
                dense: true,
                onLongPress: () {
                  setState(() {
                    educationItems.removeAt(index);
                  });
                },
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          elevation: 5.0,
          backgroundColor: Colors.blueGrey[700],
          icon: Icon(Icons.control_point),
          label: Text('Add'),
          onPressed: _showDialog,
        ));
  }

  _showDialog() async {
    await showDialog<String>(
        context: context,
        child: new AlertDialog(
            contentPadding: const EdgeInsets.all(16.0),
            content: new Row(
              children: <Widget>[
                new Expanded(
                    child: new TextField(
                  autofocus: true,
                  decoration: new InputDecoration(labelText: 'New Expense'),
                ))
              ],
            )));
  }
}

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  final List<String> foodItems = [
    'Groceries',
    'Ramen Bar',
    'Boba',
    'Ice Cream'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          elevation: 0.0,
          title: Text('Food'),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: ListView.builder(
          itemCount: foodItems.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 3.0,
              margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
              color: Colors.blueGrey[700],
              child: ListTile(
                title: Text(
                  '${foodItems[index]}',
                  style: TextStyle(fontSize: 15.0, color: Colors.white),
                ),
                dense: true,
              ),
            );
          },
        ),
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
  final List<String> transportationItems = [
    'Gas',
    'Uber',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          elevation: 0.0,
          title: Text('Transportation'),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: ListView.builder(
          itemCount: transportationItems.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 3.0,
              margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
              color: Colors.blueGrey[700],
              child: ListTile(
                title: Text(
                  '${transportationItems[index]}',
                  style: TextStyle(fontSize: 15.0, color: Colors.white),
                ),
                dense: true,
              ),
            );
          },
        ),
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
  final List<String> entertainmentItems = [
    'Netflix',
    'Spotify',
    'Movie Theater',
    'Mini Golf'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          elevation: 0.0,
          title: Text('Entertainment'),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: ListView.builder(
          itemCount: entertainmentItems.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 3.0,
              margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
              color: Colors.blueGrey[700],
              child: ListTile(
                title: Text(
                  '${entertainmentItems[index]}',
                  style: TextStyle(fontSize: 15.0, color: Colors.white),
                ),
                dense: true,
              ),
            );
          },
        ),
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
  final List<String> otherItems = ['Clothes'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          elevation: 0.0,
          title: Text('Other'),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: ListView.builder(
          itemCount: otherItems.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 3.0,
              margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
              color: Colors.blueGrey[700],
              child: ListTile(
                title: Text(
                  '${otherItems[index]}',
                  style: TextStyle(fontSize: 15.0, color: Colors.white),
                ),
                dense: true,
              ),
            );
          },
        ),
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
