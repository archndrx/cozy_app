import 'package:cozy_app/theme.dart';
import 'package:flutter/material.dart';

class Ratingitem extends StatelessWidget {
  final int index, rating;

  Ratingitem({required this.rating, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      child: Image.asset(
        index <= rating ? 'image/icon-star.png' : 'image/icon-star-grey.png',
      ),
    );
  }
}
