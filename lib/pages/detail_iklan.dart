import 'package:flutter/material.dart';
import 'package:submission_flutter_pemua/bloc/produk_bloc.dart';
import 'package:submission_flutter_pemua/content.dart';
import 'package:submission_flutter_pemua/model/produk.dart';
import 'package:submission_flutter_pemua/pages/home_page.dart';
import 'package:submission_flutter_pemua/pages/iklan_form.dart';
import 'package:submission_flutter_pemua/pages/iklan_page.dart';
import 'package:submission_flutter_pemua/theme.dart';
import 'package:submission_flutter_pemua/widget/warning_dialog.dart';

import '../theme.dart';

// ignore: must_be_immutable
class ProdukDetail extends StatefulWidget {
  Produk produk;
  ProdukDetail({this.produk});
  @override
  _ProdukDetailState createState() => _ProdukDetailState();
}

class _ProdukDetailState extends State<ProdukDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueColor,
        title: Text(
          'Detail donasi',
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Stack(children: <Widget>[
          Image.network(
            widget.produk.url,
            width: MediaQuery.of(context).size.width,
            height: 350,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: edge,
              vertical: 30,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            // ignore: missing_required_param
                            builder: (context) => HomePage()));
                  },
                  child: Image.asset(
                    'assets/images/btn_back.png',
                    width: 40,
                  ),
                ),
              ],
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
                    top: Radius.circular(20),
                  ),
                  color: whiteColor,
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: edge,
                      ),
                      child: Row(
                        children: <Widget>[
                          SingleChildScrollView(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    widget.produk.judulIklan,
                                    style: blackTextStyle.copyWith(
                                      fontSize: 24,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                      'Dana yang terkumpul : ${widget.produk.danaCollected}'),
                                  Text(
                                      'Dana yang dibutuhkan : ${widget.produk.danaNeed}'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Deskripsi : ',
                                    style: blackTextStyle.copyWith(
                                      fontSize: 20,
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      '${widget.produk.cerita}',
                                    ),
                                  ),
                                  Container(
                                    // ignore: deprecated_member_use
                                    child: FlatButton(
                                        onPressed: () {},
                                        child: _tombolHapusEdit()),
                                  )
                                ]),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  Widget _tombolHapusEdit() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
//Tombol Edit
        // ignore: deprecated_member_use
        FlatButton(
            child: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => IklanForm(
                            produk: widget.produk,
                          )));
            }),
//Tombol Hapus
        FlatButton(child: Icon(Icons.delete), onPressed: () => confirmHapus()),
      ],
    );
  }

  void confirmHapus() {
    AlertDialog alertDialog = new AlertDialog(
      content: Text("Yakin ingin menghapus data ini?"),
      actions: [
//tombol hapus
        RaisedButton(
          child: Text("Ya"),
          color: Colors.green,
          onPressed: () {
            ProdukBloc.deleteProduk(id: widget.produk.id).then((value) {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => AllContent()));
            }, onError: (error) {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => WarningDialog(
                        description: "Hapus data gagal, silahkan coba lagi",
                      ));
            });
          },
        ),
//tombol batal
        RaisedButton(
          child: Text("Batal"),
          color: Colors.red,
          onPressed: () => Navigator.pop(context),
        )
      ],
    );

    showDialog(builder: (context) => alertDialog, context: context);
  }
}
