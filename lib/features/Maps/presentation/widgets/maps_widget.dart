import 'package:flutter/material.dart';

Widget MapsWidget(
    {required double screenW,
    required double heightImage,
    required bool state_perso_map}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ConstrainedBox(
        constraints:
            BoxConstraints.tightFor(width: screenW, height: heightImage),
        child: InteractiveViewer(
            panEnabled: true, // Set it to false
            boundaryMargin: EdgeInsets.all(0),
            minScale: 0.1,
            maxScale: 5,
            child: state_perso_map
                ? Image.asset('images/maps_preview_perso.png',
                    width: screenW, height: heightImage, fit: BoxFit.cover)
                : Image.asset('images/maps_preview.png',
                    width: screenW, height: heightImage, fit: BoxFit.cover)),
      ),
    ],
  );
}
