import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

Widget alertContainer(BuildContext context, text){
  return Container(
    margin: const EdgeInsets.all(10.0),
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Center(
      child: Text(text),
    ),
  );
}

CarouselOptions carouselOptions = CarouselOptions(
  height: 80.0,
  autoPlay: true,
  autoPlayInterval: const Duration(seconds: 3),
  pauseAutoPlayOnTouch: true,
  autoPlayCurve: Curves.easeInSine,
  enlargeCenterPage: true,
  scrollDirection: Axis.horizontal,
  enableInfiniteScroll: true,
);

