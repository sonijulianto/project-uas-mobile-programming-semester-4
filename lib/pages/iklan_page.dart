import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:submission_flutter_pemua/bloc/produk_bloc.dart';
import 'package:submission_flutter_pemua/model/produk.dart';
import 'package:submission_flutter_pemua/pages/detail_iklan.dart';

class IklanPage extends StatefulWidget {
  @override
  _IklanPageState createState() => _IklanPageState();
}

class _IklanPageState extends State<IklanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List>(
        future: ProdukBloc.getProduks(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListProduk(
                  list: snapshot.data,
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ListProduk extends StatelessWidget {
  final List list;

  ListProduk({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, i) {
          return ItemProduk(
            produk: list[i],
          );
        });
  }
}

class ItemProduk extends StatelessWidget {
  final Produk produk;
  ItemProduk({this.produk});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) => ProdukDetail(
                        produk: produk,
                      )));
        },
        child: Card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Image.network(produk.url),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        produk.judulIklan,
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(produk.danaNeed.toString()),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
