import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:food_app/widgets/tab_widget.dart';
import 'package:food_app/widgets/food_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final foods = [
    [
      'Veg Noddles',
      'assets/images/food1.png',
      4.5,
      'Stir-fried made with loads of mix vegetables\nand seasoned with soy sauce, ginger, garlic.',
      90,
    ],
    [
      'Chicken Noddles',
      'assets/images/food2.png',
      4.7,
      'Packed meal of stir fried noodles, chicken,\nvegetables. Made in Chinese Hakka Style!',
      120,
    ],
    [
      'Ham Sandwich',
      'assets/images/food3.png',
      4.8,
      'Sandwich made with bread, ham, cheese,\nlettuce, tomato, onion, and mayonnaise.',
      150,
    ],
    [
      'Veg Pizza',
      'assets/images/food4.png',
      4.9,
      'fresh and full of flavor, featuring cherry tomatoes,\nartichoke, bell pepper, olives.',
      220,
    ],
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 187, 77),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 70, 70),
        elevation: 0,
        title: Row(
          children: [
            SvgPicture.asset(
              'assets/images/location-point.svg',
              width: size * 0.055,
            ),
            SizedBox(
              width: size * 0.010,
            ),
            Text(
              'Welcome to our Restaurant',
              style: GoogleFonts.poppins(
                fontSize: size * 0.040,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: SvgPicture.asset(
              'assets/images/menu 2.svg',
              width: size * 0.060,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 20.0,
              ),
              child: Text(
                'Reccomanded for you',
                style: GoogleFonts.poppins(
                  fontSize: size * 0.050,
                  color: AppTheme.purpleText,
                ),
              ),
            ),
            SizedBox(
              height: size * 0.020,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TabWidget(
                    size: size,
                    text: 'Top Charts',
                    color: AppTheme.lightColor,
                  ),
                  TabWidget(
                    size: size,
                    text: 'Rated 4+',
                  ),
                  TabWidget(
                    size: size,
                    text: 'Spicy',
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
                    ),
                    child: SvgPicture.asset(
                      'assets/images/list.svg',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size * 0.050,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                width: double.infinity,
                // height: 500,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: foods.length,
                  itemBuilder: (context, index) {
                    return FoodWidget(
                      size: size,
                      foodName: foods[index][0].toString(),
                      image: foods[index][1].toString(),
                      price: double.parse(foods[index][4].toString()),
                      star: double.parse(foods[index][2].toString()),
                      review: foods[index][3].toString(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
