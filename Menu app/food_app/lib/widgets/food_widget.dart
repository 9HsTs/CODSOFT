import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodWidget extends StatelessWidget {
  const FoodWidget({
    super.key,
    required this.size,
    required this.foodName,
    required this.star,
    required this.review,
    required this.price,
    required this.image,
  });

  final double size;
  final String foodName;
  final double star;
  final String review;
  final double price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      width: double.infinity,
      height: size * 0.30,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 251, 251),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.3),
              blurRadius: 5,
              spreadRadius: 1,
            )
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                foodName,
                style: GoogleFonts.poppins(
                  fontSize: size * 0.035,
                  color: AppTheme.purpleText,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.star,
                    size: 20,
                    color: AppTheme.lightColor,
                  ),
                  Text(
                    star.toString(),
                    style: GoogleFonts.poppins(
                      fontSize: size * 0.030,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  Text(
                    '($review)',
                    style: GoogleFonts.poppins(
                      fontSize: size * 0.030,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size * 0.050,
              ),
              Row(
                children: [
                  Text(
                    r'Rs',
                    style: GoogleFonts.poppins(
                      fontSize: size * 0.040,
                      color: AppTheme.boldTextColor,
                    ),
                  ),
                  Text(
                    price.toString(),
                    style: GoogleFonts.poppins(
                      fontSize: size * 0.040,
                      color: AppTheme.boldTextColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
