import 'package:app/theme.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: defaultMargin,
        right: defaultMargin,
        bottom: defaultMargin,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assets/shoes_example_1.png",
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Football",
                  style: secondaryTextStyle.copyWith(fontSize: 12),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  "Predator 20.3 Firm Ground",
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  "\$58.67",
                  style: priceTextStyle.copyWith(fontWeight: medium),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
