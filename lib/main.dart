import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PIApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'News Feed'),
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
  Map<int, Color> colorCodes = {
    50: Color.fromRGBO(255, 90, 34, .1),
    100: Color.fromRGBO(255, 90, 34, .2),
    200: Color.fromRGBO(255, 90, 34, .3),
    300: Color.fromRGBO(255, 90, 34, .4),
    400: Color.fromRGBO(255, 90, 34, .5),
    500: Color.fromRGBO(255, 90, 34, .6),
    600: Color.fromRGBO(255, 90, 34, .7),
    700: Color.fromRGBO(255, 90, 34, .8),
    800: Color.fromRGBO(255, 90, 34, .9),
    900: Color.fromRGBO(255, 90, 34, 1),
  };
  Color selectedColor = Color.fromRGBO(255, 90, 34, 1);
  Color notselectedColor = Colors.black;
  int _selectedindex = 0;

  void _ontapch(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      DefaultTabController(
          length: 2,
          child: Scaffold(
              appBar: AppBar(
                toolbarHeight: 50,
                titleSpacing: 0,
                elevation: 0,
                backgroundColor: MaterialColor(0xFFF15A22, colorCodes),
                bottom: TabBar(
                  tabs: [
                    Tab(child: Text("USTHB")),
                    Tab(child: Text("PI CLUB"))
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  Icon(Icons.directions_car),
                  Icon(Icons.directions_transit),
                ],
              ))),
      Text(
        'Index 2: School',
      ),
      Text(
        'Index 3: School',
      ),
      Text(
        'Index 3: School',
      ),
    ];

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          toolbarHeight: 60,
          centerTitle: true,
          title: Text(
            widget.title,
            style: TextStyle(
                fontSize: 30, color: MaterialColor(0xFFF15A22, colorCodes)),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.article,
                  color: Colors.black,
                ),
                title: Text(
                  "News",
                  style: TextStyle(color: Colors.black),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.school_outlined,
                  color: Colors.black,
                ),
                title: Text(
                  "Scolarité",
                  style: TextStyle(color: Colors.black),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.map_outlined,
                  color: Colors.black,
                ),
                title: Text(
                  "Maps",
                  style: TextStyle(color: Colors.black),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.info_outline,
                  color: Colors.black,
                ),
                title: Text(
                  "Info",
                  style: TextStyle(color: Colors.black),
                )),
          ],
          currentIndex: _selectedindex,
          onTap: _ontapch,
        ),
        body: Center(child: _widgetOptions.elementAt(_selectedindex)));
  }
}
