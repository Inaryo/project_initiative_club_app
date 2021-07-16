import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_initiative_club_app/features/About%20Us/presentation/pages/about_us_page.dart';
import 'package:project_initiative_club_app/features/About%20Us/presentation/pages/about_us_page_1.dart';
import 'package:project_initiative_club_app/features/Maps/domain/entities/maps_data.dart';
import 'package:project_initiative_club_app/features/Maps/presentation/pages/page_maps.dart';
import 'package:project_initiative_club_app/features/News/presentation/pages/news_page.dart';
import 'package:project_initiative_club_app/features/Scolarity/presentation/pages/scolarity_page.dart';
import 'package:project_initiative_club_app/ressources/globals.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

Future<void> getAllMapData() async {
  Map<String, dynamic> data =
      await jsonDecode(await rootBundle.loadString('json/info_map.json'));
  jsonData = data;
  print(jsonData);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: currentTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool error = false;
  bool initialized = false;

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
      NewsPage(),
      ScolarityPage(),
      MapsPage(),
      AboutUsPageSecondary(),
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
