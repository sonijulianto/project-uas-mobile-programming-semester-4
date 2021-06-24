// import 'package:flutter/material.dart';
// import 'package:submission_flutter_pemua/model/donations.dart';
// import 'package:submission_flutter_pemua/theme.dart';

// class DetailScreen extends StatelessWidget {
//   final Donations donations;

//   DetailScreen({@required this.donations});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         bottom: false,
//         child: Stack(
//           children: [
//             Image.asset(
//               donations.imageUrl,
//               width: MediaQuery.of(context).size.width,
//               height: 350,
//               fit: BoxFit.cover,
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: edge,
//                 vertical: 30,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   InkWell(
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                     child: Image.asset(
//                       'assets/images/btn_back.png',
//                       width: 40,
//                     ),
//                   ),
//                   Image.asset(
//                     'assets/images/btn_wishlist.png',
//                     width: 40,
//                   ),
//                 ],
//               ),
//             ),
//             ListView(
//               children: [
//                 SizedBox(
//                   height: 328,
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.vertical(
//                       top: Radius.circular(20),
//                     ),
//                     color: whiteColor,
//                   ),
//                   child: Column(
//                     children: <Widget>[
//                       SizedBox(
//                         height: 30,
//                       ),
//                       Padding(
//                         padding: EdgeInsets.symmetric(
//                           horizontal: edge,
//                         ),
//                         child: Row(
//                           children: <Widget>[
//                             SingleChildScrollView(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: <Widget>[
//                                   Text(
//                                     donations.title,
//                                      style: blackTextStyle.copyWith(
//                                        fontSize: 24,
//                                      ),
//                                   ),
//                                   SizedBox(height: 10,),
//                                   Text('Dana yang terkumpul : ${donations.totalDonation}'),
//                                   Text('Dana yang dibutuhkan : ${donations.currentDonation}'),
//                                   SizedBox(height: 10,),
//                                   Text(
//                                     'Deskripsi : ',
//                                     style: blackTextStyle.copyWith(
//                                       fontSize: 20,
//                                     ),
//                                   ),
//                                   Container(
//                                     child: Text(
//                                       '${donations.description}',
//                                     ),
//                                   ),
//                                   Container(
//                                     height: 50,
//                                     width: MediaQuery.of(context).size.width,
//                                     // ignore: deprecated_member_use
//                                     child: FlatButton(
//                                       onPressed: () {},
//                                       color: blueColor,
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(17),
//                                       ),
//                                       child: Text(
//                                         'Donasi Sekarang',
//                                         style: whiteTextStyle.copyWith(
//                                           fontSize: 18,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 40,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class FavoriteButton extends StatefulWidget {
//   final Donations donations;
//   FavoriteButton({this.donations});
//   @override
//   _FavoriteButtonState createState() => _FavoriteButtonState();
// }

// class _FavoriteButtonState extends State<FavoriteButton> {
//   bool isFavorite = false;

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       icon: Icon(
//         isFavorite ? Icons.favorite : Icons.favorite_border,
//         color: Colors.red,
//       ),
//       onPressed: () {
//         setState(() {
//           isFavorite = !isFavorite;
//         });
//       },
//     );
//   }
// }
