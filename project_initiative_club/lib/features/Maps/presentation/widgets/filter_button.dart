import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:project_initiative_club_app/ressources/globals.dart';

class FilterButtonWidget extends StatefulWidget {
  Function filterFunction;
  FilterButtonWidget({Key? key, required this.filterFunction})
      : super(key: key);

  @override
  _FilterButtonWidgetState createState() => _FilterButtonWidgetState();
}

class _FilterButtonWidgetState extends State<FilterButtonWidget>
    with SingleTickerProviderStateMixin {
  late Animation _animRotation;
  late Animation _animSlide;
  bool isFav = false;
  List<bool> statesFilters = [false, false, false, false, false];
  late AnimationController _animController;
  @override
  void initState() {
    super.initState();

    _animController =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);

    _animRotation =
        Tween<double>(begin: 0, end: math.pi).animate(_animController);

    _animController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isFav = true;
        });
      } else if (status == AnimationStatus.dismissed) {
        setState(() {
          isFav = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenW = MediaQuery.of(context).size.width;
    double caseHeight = 32.0;
    double caseWidth = screenW * 0.45;
    double radius = 10;
    double paddingChildren = caseWidth * 0.06;

    return AnimatedBuilder(
        animation: _animController,
        builder: (BuildContext context, _) {
          return Column(children: [
            GestureDetector(
              onTap: () {
                isFav ? _animController.reverse() : _animController.forward();
              },
              child: Container(
                height: caseHeight,
                width: caseWidth,
                decoration: BoxDecoration(
                    color: mainColor,
                    border: Border.all(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(radius))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Transform.rotate(
                        angle: _animRotation.value,
                        child: Icon(Icons.expand_less_outlined)),
                    Text("Filtrer")
                  ],
                ),
              ),
            ),
            Opacity(
              opacity: _animController.value,
              child: Container(
                height: _animController.value * (5 * caseHeight),
                width: caseWidth,
                child: ListView.builder(
                    padding: EdgeInsets.only(
                        left: paddingChildren, right: paddingChildren),
                    itemCount: statesFilters.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                          onTap: () {
                            setState(() {
                              statesFilters[index] = !statesFilters[index];
                            });
                            this.widget.filterFunction(index);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: index == 4
                                  ? BorderRadius.vertical(
                                      bottom: Radius.circular(radius))
                                  : null,
                              border:
                                  Border.all(color: Colors.white, width: 0.75),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                statesFilters[index]
                                    ? Icon(Icons.visibility)
                                    : Icon(Icons.visibility_off),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(mapFilter[index]!)
                              ],
                            ),
                          ));
                    }),
              ),
            ),
          ]);
        });
  }
}

/*TweenAnimationBuilder(
      duration: Duration(milliseconds: 1200),
      tween: Tween<double>(begin: _begin, end: _end),
      builder: (BuildContext _context, double _val, _) {
        if (_val == _end && _val == 1) {
          _end = 0;
          _begin = 1;
        } else if (_val == _end && _val == 0) {
          _end = 1;
          _begin = 0;
        }

        return GestureDetector(
          onTap: () {},
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Transform.rotate(
                angle: math.pi, child: Icon(Icons.expand_less_outlined)),
            SizedBox(width: 5),
          ]),
        );
      },
    )*/
