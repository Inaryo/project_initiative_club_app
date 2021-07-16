import 'package:flutter/material.dart';

@override
Widget ButtonMapVersionChange(
    {required double screenH,
    required double screenW,
    required Function function}) {
  return ConstrainedBox(
    constraints:
        BoxConstraints.tightFor(width: screenW / 1.35, height: screenH / 18.5),
    child: Container(
      margin: EdgeInsets.only(top: 5),
      child: ElevatedButton(
        style:
            ElevatedButton.styleFrom(primary: Color.fromRGBO(255, 90, 34, 1)),
        onPressed: () => function(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.track_changes),
            Text("Changer La Version de la Map")
          ],
        ),
      ),
    ),
  );
}
