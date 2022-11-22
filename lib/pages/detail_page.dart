import 'package:cozy_app/model/facility.dart';
import 'package:cozy_app/model/photos.dart';
import 'package:cozy_app/model/space.dart';
import 'package:cozy_app/pages/error_page.dart';
import 'package:cozy_app/pages/homepage.dart';
import 'package:cozy_app/theme.dart';
import 'package:cozy_app/widgets/facility_item.dart';
import 'package:cozy_app/widgets/photos_card.dart';
import 'package:cozy_app/widgets/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'package:url_launcher/link.dart';

class DetailPage extends StatelessWidget {
  final Space space;

  DetailPage(this.space);

  @override
  Widget build(BuildContext context) {
    launchUrl(String url) async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => ErrorPage())));
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.network(
                space.imageUrl,
                width: MediaQuery.of(context).size.width,
                height: 350,
                fit: BoxFit.cover,
              ),
            ),
            ListView(
              children: [
                SizedBox(
                  height: 328,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  space.name,
                                  style: itemTitlePageText,
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: '\$${space.price}',
                                    style: itemPriceText,
                                    children: [
                                      TextSpan(
                                        text: ' / month',
                                        style: itemDescText,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                                children: [1, 2, 3, 4, 5].map((index) {
                              return Container(
                                margin: EdgeInsets.only(left: 2),
                                child: Ratingitem(
                                  index: index,
                                  rating: space.rating,
                                ),
                              );
                            }).toList())
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Main Facilities',
                          style: itemTitleText,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FacilitiesItem(
                              facility: Facility('kitchen', 'image/icon2.png',
                                  space.kitchenNum),
                            ),
                            FacilitiesItem(
                              facility: Facility(
                                  'bedroom', 'image/icon1.png', space.bedNum),
                            ),
                            FacilitiesItem(
                              facility: Facility('wardrobe', 'image/icon3.png',
                                  space.wardrobeNum),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Photos',
                          style: itemTitleText,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          height: 88,
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: space.photos.map((item) {
                                return Container(
                                  margin: EdgeInsets.only(left: 18),
                                  child: ClipRRect(
                                    child: Image.network(
                                      item,
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                );
                              }).toList()),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Location',
                          style: itemTitleText,
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${space.address}\n${space.city}',
                              style: subItemPageText,
                            ),
                            InkWell(
                              onTap: () {
                                launchUrl(space.mapUrl);
                              },
                              child: Image.asset(
                                'image/btn_map.png',
                                height: 30,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: RaisedButton(
                            onPressed: () {
                              if (int.tryParse(space.phone) == null) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: ((context) => ErrorPage()),
                                  ),
                                );
                              } else {
                                launchUrl('tel:${int.tryParse(space.phone)}');
                              }
                            },
                            color: purpleColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17),
                            ),
                            child: Text(
                              'Book Now',
                              style: buttonText,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (() {
                      Navigator.pop(context);
                    }),
                    child: Image.asset(
                      'image/btn_back.png',
                      width: 40,
                      height: 40,
                    ),
                  ),
                  FavoriteButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  FavoriteButton({Key? key}) : super(key: key);

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      child: IconButton(
        icon: Image.asset(
            isFavorite ? 'asset/Icon_love_color.png' : "asset/Icon_love.png"),
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        },
      ),
    );
  }
}
