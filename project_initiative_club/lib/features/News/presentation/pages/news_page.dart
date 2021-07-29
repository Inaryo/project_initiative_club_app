import 'package:flutter/material.dart';
import 'package:project_initiative_club_app/features/News/presentation/widgets/pi_news.dart';
import 'package:project_initiative_club_app/features/News/presentation/widgets/usthb_news.dart';
import 'package:project_initiative_club_app/ressources/globals.dart';

class NewsPage extends StatelessWidget {
  NewsPage({Key? key}) : super(key: key) {
    currentTitle = "News Feed";
  }

  @override
  Widget build(BuildContext context) {
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

    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 50,
              titleSpacing: 0,
              elevation: 0,
              backgroundColor: MaterialColor(0xFFF15A22, colorCodes),
              bottom: TabBar(
                tabs: [Tab(child: Text("USTHB")), Tab(child: Text("PI CLUB"))],
              ),
            ),
            body: TabBarView(
              children: [
                UsthbNews(),
                PiNews(),
              ],
            )));
  }
}
