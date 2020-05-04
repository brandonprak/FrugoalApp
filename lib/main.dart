import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Frugoal',
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
      home: MyHomePage(title: 'Frugoal Home Page'),
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover),
        ),
        child: Column(
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
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 5.0,
        backgroundColor: Colors.blueGrey[700],
        icon: Icon(Icons.list),
        label: Text('Categories'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CategoryPage()),
          );
        },
      ),
    );
  }
}

class CategoryPage extends StatelessWidget {
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover),
        ),
        child: ListView.builder(
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
                        MaterialPageRoute(
                            builder: (context) => EducationPage()),
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
      ),
    );
  }
}

class EducationPage extends StatefulWidget {
  @override
  _EducationPageState createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  List<String> educationItems = ['Textbooks', 'Parking Pass', 'Binders'];
  List<String> educationPrices = ['300', '200', '10'];

  TextEditingController itemController = new TextEditingController();
  TextEditingController priceController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _update();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          elevation: 0.0,
          title: Text('Education'),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover),
          ),
          child: ListView.builder(
            itemCount: educationItems.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 3.0,
                margin:
                    new EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
                color: Colors.blueGrey[700],
                child: ListTile(
                  title: Text(
                    '${educationItems[index]}',
                    style: TextStyle(fontSize: 15.0, color: Colors.white),
                  ),
                  subtitle: Text(
                    '\$${educationPrices[index]}',
                    style: TextStyle(color: Colors.white),
                  ),
                  dense: true,
                  onLongPress: () {
                    setState(() {
                      _remove(index);
                    });
                  },
                ),
              );
            },
          ),
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
          content: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: itemController,
                autofocus: true,
                decoration: new InputDecoration(labelText: 'Item'),
              ),
              TextField(
                controller: priceController,
                decoration: new InputDecoration(labelText: 'Price (\$)'),
              ),
            ],
          ),
          actions: <Widget>[
            new FlatButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context);
                }),
            new FlatButton(
                child: const Text('Enter'),
                onPressed: () {
                  setState(() {
                    _addItem(itemController.text);
                    _addPrice(priceController.text);
                    Navigator.pop(context);
                    itemController.clear();
                    priceController.clear();
                  });
                }),
          ],
        ));
  }

  _addItem(String item) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      educationItems.add(item);
      prefs.setStringList('educationItems', educationItems);
    });
  }

  _addPrice(String price) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      educationPrices.add(price);
      prefs.setStringList('educationPrices', educationPrices);
    });
  }

  _remove(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      educationItems.removeAt(index);
      educationPrices.removeAt(index);
      prefs.setStringList('educationItems', educationItems);
      prefs.setStringList('educationPrices', educationPrices);
    });
  }

  _update() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      educationItems = prefs.getStringList('educationItems') ?? 0;
      educationPrices = prefs.getStringList('educationPrices') ?? 0;
    });
  }
}

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  List<String> foodItems = ['Groceries', 'Ramen Bar', 'Boba', 'Ice Cream'];
  List<String> foodPrices = ['140', '25', '3', '2'];

  TextEditingController itemController = new TextEditingController();
  TextEditingController priceController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _update();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          elevation: 0.0,
          title: Text('Food'),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover),
          ),
          child: ListView.builder(
            itemCount: foodItems.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 3.0,
                margin:
                    new EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
                color: Colors.blueGrey[700],
                child: ListTile(
                  title: Text(
                    '${foodItems[index]}',
                    style: TextStyle(fontSize: 15.0, color: Colors.white),
                  ),
                  subtitle: Text(
                    '\$${foodPrices[index]}',
                    style: TextStyle(color: Colors.white),
                  ),
                  dense: true,
                  onLongPress: () {
                    setState(() {
                      _remove(index);
                    });
                  },
                ),
              );
            },
          ),
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
          content: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: itemController,
                autofocus: true,
                decoration: new InputDecoration(labelText: 'Item'),
              ),
              TextField(
                controller: priceController,
                decoration: new InputDecoration(labelText: 'Price (\$)'),
              ),
            ],
          ),
          actions: <Widget>[
            new FlatButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context);
                }),
            new FlatButton(
                child: const Text('Enter'),
                onPressed: () {
                  setState(() {
                    _addItem(itemController.text);
                    _addPrice(priceController.text);
                    Navigator.pop(context);
                    itemController.clear();
                    priceController.clear();
                  });
                }),
          ],
        ));
  }

  _addItem(String item) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      foodItems.add(item);
      prefs.setStringList('foodItems', foodItems);
    });
  }

  _addPrice(String price) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      foodPrices.add(price);
      prefs.setStringList('foodPrices', foodPrices);
    });
  }

  _remove(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      foodItems.removeAt(index);
      foodPrices.removeAt(index);
      prefs.setStringList('foodItems', foodItems);
      prefs.setStringList('foodPrices', foodPrices);
    });
  }

  _update() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      foodItems = prefs.getStringList('foodItems') ?? 0;
      foodPrices = prefs.getStringList('foodPrices') ?? 0;
    });
  }
}

class TransportationPage extends StatefulWidget {
  @override
  _TransportationPageState createState() => _TransportationPageState();
}

class _TransportationPageState extends State<TransportationPage> {
  List<String> transportationItems = ['Gas', 'Uber'];
  List<String> transportationPrices = ['40', '15'];

  TextEditingController itemController = new TextEditingController();
  TextEditingController priceController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _update();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          elevation: 0.0,
          title: Text('Transportation'),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover),
          ),
          child: ListView.builder(
            itemCount: transportationItems.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 3.0,
                margin:
                    new EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
                color: Colors.blueGrey[700],
                child: ListTile(
                  title: Text(
                    '${transportationItems[index]}',
                    style: TextStyle(fontSize: 15.0, color: Colors.white),
                  ),
                  subtitle: Text(
                    '\$${transportationPrices[index]}',
                    style: TextStyle(color: Colors.white),
                  ),
                  dense: true,
                  onLongPress: () {
                    setState(() {
                      _remove(index);
                    });
                  },
                ),
              );
            },
          ),
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
          content: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: itemController,
                autofocus: true,
                decoration: new InputDecoration(labelText: 'Item'),
              ),
              TextField(
                controller: priceController,
                decoration: new InputDecoration(labelText: 'Price (\$)'),
              ),
            ],
          ),
          actions: <Widget>[
            new FlatButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context);
                }),
            new FlatButton(
                child: const Text('Enter'),
                onPressed: () {
                  setState(() {
                    _addItem(itemController.text);
                    _addPrice(priceController.text);
                    Navigator.pop(context);
                    itemController.clear();
                    priceController.clear();
                  });
                }),
          ],
        ));
  }

  _addItem(String item) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      transportationItems.add(item);
      prefs.setStringList('transportationItems', transportationItems);
    });
  }

  _addPrice(String price) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      transportationPrices.add(price);
      prefs.setStringList('transportationPrices', transportationPrices);
    });
  }

  _remove(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      transportationItems.removeAt(index);
      transportationPrices.removeAt(index);
      prefs.setStringList('transportationItems', transportationItems);
      prefs.setStringList('transportationPrices', transportationPrices);
    });
  }

  _update() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      transportationItems = prefs.getStringList('transportationItems') ?? 0;
      transportationPrices = prefs.getStringList('transportationPrices') ?? 0;
    });
  }
}

class EntertainmentPage extends StatefulWidget {
  @override
  _EntertainmentPageState createState() => _EntertainmentPageState();
}

class _EntertainmentPageState extends State<EntertainmentPage> {
  List<String> entertainmentItems = ['Netflix', 'Spotify', 'Movie Theater', 'Mini Golf'];
  List<String> entertainmentPrices = ['12', '10', '20', '5'];

  TextEditingController itemController = new TextEditingController();
  TextEditingController priceController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _update();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          elevation: 0.0,
          title: Text('Entertainment'),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover),
          ),
          child: ListView.builder(
            itemCount: entertainmentItems.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 3.0,
                margin:
                    new EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
                color: Colors.blueGrey[700],
                child: ListTile(
                  title: Text(
                    '${entertainmentItems[index]}',
                    style: TextStyle(fontSize: 15.0, color: Colors.white),
                  ),
                  subtitle: Text(
                    '\$${entertainmentPrices[index]}',
                    style: TextStyle(color: Colors.white),
                  ),
                  dense: true,
                  onLongPress: () {
                    setState(() {
                      _remove(index);
                    });
                  },
                ),
              );
            },
          ),
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
          content: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: itemController,
                autofocus: true,
                decoration: new InputDecoration(labelText: 'Item'),
              ),
              TextField(
                controller: priceController,
                decoration: new InputDecoration(labelText: 'Price (\$)'),
              ),
            ],
          ),
          actions: <Widget>[
            new FlatButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context);
                }),
            new FlatButton(
                child: const Text('Enter'),
                onPressed: () {
                  setState(() {
                    _addItem(itemController.text);
                    _addPrice(priceController.text);
                    Navigator.pop(context);
                    itemController.clear();
                    priceController.clear();
                  });
                }),
          ],
        ));
  }

  _addItem(String item) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      entertainmentItems.add(item);
      prefs.setStringList('entertainmentItems', entertainmentItems);
    });
  }

  _addPrice(String price) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      entertainmentPrices.add(price);
      prefs.setStringList('entertainmentPrices', entertainmentPrices);
    });
  }

  _remove(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      entertainmentItems.removeAt(index);
      entertainmentPrices.removeAt(index);
      prefs.setStringList('entertainmentItems', entertainmentItems);
      prefs.setStringList('entertainmentPrices', entertainmentPrices);
    });
  }

  _update() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      entertainmentItems = prefs.getStringList('entertainmentItems') ?? 0;
      entertainmentPrices = prefs.getStringList('entertainmentPrices') ?? 0;
    });
  }
}

class OtherPage extends StatefulWidget {
  @override
  _OtherPageState createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
  List<String> otherItems = ['Clothes'];
  List<String> otherPrices = ['30'];

  TextEditingController itemController = new TextEditingController();
  TextEditingController priceController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _update();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          elevation: 0.0,
          title: Text('Other'),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover),
          ),
          child: ListView.builder(
            itemCount: otherItems.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 3.0,
                margin:
                    new EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
                color: Colors.blueGrey[700],
                child: ListTile(
                  title: Text(
                    '${otherItems[index]}',
                    style: TextStyle(fontSize: 15.0, color: Colors.white),
                  ),
                  subtitle: Text(
                    '\$${otherPrices[index]}',
                    style: TextStyle(color: Colors.white),
                  ),
                  dense: true,
                  onLongPress: () {
                    setState(() {
                      _remove(index);
                    });
                  },
                ),
              );
            },
          ),
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
          content: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: itemController,
                autofocus: true,
                decoration: new InputDecoration(labelText: 'Item'),
              ),
              TextField(
                controller: priceController,
                decoration: new InputDecoration(labelText: 'Price (\$)'),
              ),
            ],
          ),
          actions: <Widget>[
            new FlatButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context);
                }),
            new FlatButton(
                child: const Text('Enter'),
                onPressed: () {
                  setState(() {
                    _addItem(itemController.text);
                    _addPrice(priceController.text);
                    Navigator.pop(context);
                    itemController.clear();
                    priceController.clear();
                  });
                }),
          ],
        ));
  }

  _addItem(String item) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      otherItems.add(item);
      prefs.setStringList('otherItems', otherItems);
    });
  }

  _addPrice(String price) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      otherPrices.add(price);
      prefs.setStringList('otherPrices', otherPrices);
    });
  }

  _remove(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      otherItems.removeAt(index);
      otherPrices.removeAt(index);
      prefs.setStringList('otherItems', otherItems);
      prefs.setStringList('otherPrices', otherPrices);
    });
  }

  _update() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      otherItems = prefs.getStringList('otherItems') ?? 0;
      otherPrices = prefs.getStringList('otherPrices') ?? 0;
    });
  }
}
