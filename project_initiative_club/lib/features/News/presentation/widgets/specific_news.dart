import 'package:flutter/material.dart';
import 'package:project_initiative_club_app/features/About%20Us/presentation/widgets/carousel_widget.dart';
import 'package:project_initiative_club_app/features/News/domain/entities/newsEntity.dart';
import 'package:project_initiative_club_app/features/News/presentation/widgets/likes_title.dart';
import 'package:project_initiative_club_app/ressources/globals.dart';

class SpecificNewsPage extends StatelessWidget {
  NewsEntity news;
  SpecificNewsPage({Key? key, required this.news}) : super(key: key);

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

    double screenH = MediaQuery.of(context).size.height;
    double screenW = MediaQuery.of(context).size.width;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            toolbarHeight: 60,
            centerTitle: true,
            title: Text(
              currentTitle,
              style: TextStyle(
                  fontSize: 30, color: MaterialColor(0xFFF15A22, colorCodes)),
            ),
          ),
          body: ListView(children: [
            carouselWidget(news.images, screenH, screenW),
            LikesAndModificationWidget(news),
            SizedBox(height: screenH * 0.05),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: screenW * 0.7),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(news.title,
                        style: TextStyle(
                            color: MaterialColor(0xFFF15A22, colorCodes),
                            fontSize: 15)),
                    SizedBox(height: screenH * 0.15),
                    Text(
                      news.description,
                      textAlign: TextAlign.start,
                    ),
                  ]),
            )
          ]),
        ));
  }
}
