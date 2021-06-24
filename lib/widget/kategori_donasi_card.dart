import 'package:flutter/material.dart';
import 'package:submission_flutter_pemua/model/donasi.dart';
import 'package:submission_flutter_pemua/theme.dart';

class KategoriDonasiCard extends StatelessWidget {
  final Donasi donasi;
  KategoriDonasiCard(this.donasi);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(18),
        topLeft: Radius.circular(18),
      ),
      child: Container(
        width: 120,
        color: Color(0xffF6F7F8),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  donasi.imageUrl,
                  width: 120,
                  height: 80,
                  fit: BoxFit.cover,
                ),
                donasi.isPopular ? Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 50,
                    height: 30,
                    decoration: BoxDecoration(
                        color: blueColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                        )),
                    child: Center(
                      child: Image.asset(
                        'assets/images/icon_star.png',
                        width: 22,
                        height: 22,
                      ),
                    ),
                  ),
                ) : Container(),
              ],
            ),
            SizedBox(
              height: 11,
            ),
            Text(
              donasi.name,
              textAlign: TextAlign.center,
              style: blackTextStyle.copyWith(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
