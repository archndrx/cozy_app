import 'package:cozy_app/model/facility.dart';
import 'package:cozy_app/theme.dart';
import 'package:flutter/material.dart';

class FacilitiesItem extends StatelessWidget {
  final Facility facility;

  FacilitiesItem({required this.facility});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          facility.imageUrl,
          width: 32,
        ),
        SizedBox(
          height: 8,
        ),
        Text.rich(
          TextSpan(
            text: '${facility.jumlah}',
            style: subItemTextColor,
            children: [
              TextSpan(
                text: ' ${facility.desc}',
                style: subItemText,
              )
            ],
          ),
        ),
      ],
    );
  }
}
