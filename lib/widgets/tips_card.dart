import 'package:cozy_app/model/space.dart';
import 'package:cozy_app/model/tips.dart';
import 'package:flutter/material.dart';
import "package:cozy_app/theme.dart";

class TipsCard extends StatelessWidget {
  final Tips tips;
  TipsCard({required this.tips});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          tips.imageUrl,
          width: 80,
          height: 80,
        ),
        SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tips.title,
              style: itemNameText,
            ),
            Text(
              'Updated ${tips.date}',
              style: subItemDescText,
            ),
          ],
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.chevron_right,
            color: lightGreyColor,
          ),
        ),
      ],
    );
  }
}
