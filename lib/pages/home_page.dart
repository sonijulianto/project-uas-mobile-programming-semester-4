import 'package:flutter/material.dart';
import 'package:submission_flutter_pemua/bloc/logout_bloc.dart';
import 'package:submission_flutter_pemua/content.dart';
import 'package:submission_flutter_pemua/model/donasi.dart';
import 'package:submission_flutter_pemua/pages/iklan_form.dart';
import 'package:submission_flutter_pemua/pages/sign_in_page.dart';
import 'package:submission_flutter_pemua/theme.dart';
import 'package:submission_flutter_pemua/widget/kategori_donasi_card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Relawan Donasi',
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Logout'),
              trailing: Icon(Icons.logout),
              onTap: () async {
                await LogoutBloc.logout().then((value) {
                  Navigator.pushReplacement(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => SignInPage()));
                });
              },
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: 16,
          ),
          child: ListView(
            children: [
              Image.asset('assets/images/banner.jpg'),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: edge,
                ),
                child: Text(
                  'Kategori Donasi',
                  style: regularTextStyle.copyWith(
                    fontSize: 22,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 140,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: 24,
                    ),
                    KategoriDonasiCard(
                      Donasi(
                        id: 1,
                        name: 'Donasi\nBencana',
                        imageUrl: 'assets/images/donasi-bencana-2.png',
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    KategoriDonasiCard(
                      Donasi(
                        id: 2,
                        name: 'Donasi\nPendidikan',
                        imageUrl: 'assets/images/donasi-pendidikan.png',
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    KategoriDonasiCard(
                      Donasi(
                        id: 3,
                        name: 'Donasi\nKesehatan',
                        imageUrl: 'assets/images/donasi-bencana.jpeg',
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    KategoriDonasiCard(
                      Donasi(
                        id: 4,
                        name: 'Donasi\nAir bersih',
                        imageUrl: 'assets/images/donasi-air-bersih.jpg',
                        isPopular: true,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    KategoriDonasiCard(
                      Donasi(
                        id: 5,
                        name: 'Donasi\nAPD',
                        imageUrl: 'assets/images/donasi-apd.jpg',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  'Donasi Populer',
                  style: regularTextStyle.copyWith(
                    fontSize: 22,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: edge,
                ),
                child: Column(
                  children: [
                    Column(
                      children: [],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // ignore: deprecated_member_use
                    RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            // ignore: missing_required_param
                            builder: (context) => AllContent(),
                          ),
                        );
                      },
                      color: blueColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Semua Donasi',
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                // ignore: missing_required_param
                builder: (context) => IklanForm(),
              ),
            );
          },
          child: Icon(Icons.add)),
    );
  }
}
