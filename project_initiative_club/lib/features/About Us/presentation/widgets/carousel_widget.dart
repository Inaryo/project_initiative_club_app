import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

Widget carouselWidget(List<String> imagesPath, double screenH, double screenW) {
  return CarouselSlider(
    options: CarouselOptions(height: 400.0, aspectRatio: 4 / 3),
    items: imagesPath.map((path) {
      return Builder(
        builder: (BuildContext context) {
          return CachedNetworkImage(
            imageUrl: path,
            width: screenW,
            height: screenH / 3,
          );
        },
      );
    }).toList(),
  );
}
