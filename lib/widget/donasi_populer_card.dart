import 'package:submission_flutter_pemua/theme.dart';
import 'package:submission_flutter_pemua/model/donations.dart';
import 'package:flutter/material.dart';

class DonasiPopulerCard extends StatelessWidget {
  final Donations donations;
  DonasiPopulerCard(this.donations);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          child: Container(
            width: 90,
            height: 90,
            child: Stack(
              children: [
                Image.asset(
                  donations.imageUrl,
                  fit: BoxFit.contain,
                  width: 90,
                  height: 90,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: 120,
                    height: 10,
                    decoration: BoxDecoration(
                      color: blueColor,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    width: 60,
                    height: 10,
                    decoration: BoxDecoration(
                      color: orangeColor,
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Progress 50%',
                            style: blackTextStyle.copyWith(
                              fontSize: 8,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 20,
          height: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              donations.title,
              style: blackTextStyle.copyWith(
                fontSize: 18,
              ),
            ),
            Text(
              'total dana : ${donations.totalDonation}',
              style: greyTextStyle.copyWith(
                fontSize: 12,
              ),
            ),
            Text(
              'yang dibutuhkan ${donations.currentDonation}',
              style: greyTextStyle.copyWith(
                fontSize: 12,
              ),
            ),
            Text(
              '${donations.category}',
              style: greyTextStyle.copyWith(
                fontSize: 12,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 18,
        ),
      ],
    );
  }
}
