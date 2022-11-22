import 'package:cozy_app/model/photos.dart';
import 'package:flutter/material.dart';

class PhotoCard extends StatelessWidget {
  final Photo photo;

  PhotoCard({required this.photo});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
        bottomLeft: Radius.circular(18),
        bottomRight: Radius.circular(18),
      ),
      child: Container(
        height: 88,
        width: 110,
        child: Row(
          children: [
            Image.asset(
              photo.imageUrl,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
