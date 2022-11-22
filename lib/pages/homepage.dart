import 'package:cozy_app/model/city.dart';
import 'package:cozy_app/model/space.dart';
import 'package:cozy_app/model/tips.dart';
import 'package:cozy_app/provider/space_provider.dart';
import 'package:cozy_app/widgets/bottom_navbar_item.dart';
import 'package:cozy_app/widgets/city_card.dart';
import 'package:cozy_app/widgets/space_card.dart';
import 'package:cozy_app/widgets/tips_card.dart';
import 'package:flutter/material.dart';
import 'package:cozy_app/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            // NOTE : TITLE/HEADER
            Padding(
              padding: EdgeInsets.only(left: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Explore Now',
                    style: pageTitleTextMedium,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Mencari kosan yang cozy',
                    style: pageSubTitleText,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  // NOTE : POPULAR CITIES
                  Text(
                    'Popular Cities',
                    style: itemTitleText,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        CityCard(
                          city: City(
                              id: 1,
                              imageUrl: 'image/city1.png',
                              name: 'Jakarta'),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CityCard(
                          city: City(
                              id: 2,
                              imageUrl: 'image/city2.png',
                              name: 'Bandung',
                              isFav: true),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CityCard(
                          city: City(
                              id: 3,
                              imageUrl: 'image/city3.png',
                              name: 'Surabaya'),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CityCard(
                          city: City(
                              id: 4,
                              imageUrl: 'image/city4.png',
                              name: 'Palembang'),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CityCard(
                          city: City(
                              id: 3,
                              imageUrl: 'image/city5.png',
                              name: 'Aceh',
                              isFav: true),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CityCard(
                          city: City(
                              id: 3,
                              imageUrl: 'image/city6.png',
                              name: 'Bogor'),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //  NOTE : RECOMMENDED SPACE
                  Text(
                    'Recommended Space',
                    style: itemTitleText,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  FutureBuilder(
                      future: spaceProvider.getRecommendedSpaces(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List? data = snapshot.data as List?;

                          int index = 0;

                          return Column(
                              children: data!.map((item) {
                            index++;
                            return Container(
                              margin: EdgeInsets.only(
                                top: index == 1 ? 0 : 30,
                              ),
                              child: SpaceCard(
                                space: item,
                              ),
                            );
                          }).toList());
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }),

                  SizedBox(
                    height: 30,
                  ),
                  // NOTE : TIPS & GUIDANCE
                  Text(
                    'Tips & Guidance',
                    style: itemTitleText,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Column(
                    children: [
                      TipsCard(
                        tips: Tips(
                            1, 'City Guidelines', 'image/pic6.png', '20 April'),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TipsCard(
                        tips: Tips(2, 'Jakarta Fairship', 'image/pic7.png',
                            '11 December'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * 24),
        decoration: BoxDecoration(
          color: Color(0xffF6F7F8),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbarItem('asset/Icon_home.png', true),
            BottomNavbarItem('asset/Icon_mail.png', false),
            BottomNavbarItem('asset/Icon_card.png', false),
            BottomNavbarItem('asset/Icon_love.png', false),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
