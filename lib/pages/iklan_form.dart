import 'package:flutter/material.dart';
import 'package:submission_flutter_pemua/bloc/produk_bloc.dart';
import 'package:submission_flutter_pemua/content.dart';
import 'package:submission_flutter_pemua/model/produk.dart';
import 'package:submission_flutter_pemua/theme.dart';
import 'package:submission_flutter_pemua/widget/warning_dialog.dart';

// ignore: must_be_immutable
class IklanForm extends StatefulWidget {
  Produk produk;
  IklanForm({this.produk});
  @override
  _IklanFormState createState() => _IklanFormState();
}

class _IklanFormState extends State<IklanForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String judul = "TAMBAH PRODUK";
  String tombolSubmit = "SIMPAN";

  final _judulIklanTextboxController = TextEditingController();
  final _urlTextboxController = TextEditingController();
  final _danaNeedTextboxController = TextEditingController();
  final _danaCollectedTextboxController = TextEditingController();
  final _ceritaTextboxController = TextEditingController();

  @override
  void initState() {
// TODO: implement initState
    super.initState();
    isUpdate();
  }

  isUpdate() {
    if (widget.produk != null) {
      setState(() {
        judul = "UBAH PRODUK";
        tombolSubmit = "UBAH";
        _judulIklanTextboxController.text = widget.produk.judulIklan;
        _urlTextboxController.text = widget.produk.url;
        _danaNeedTextboxController.text = widget.produk.danaNeed.toString();
        _danaCollectedTextboxController.text =
            widget.produk.danaCollected.toString();
        _ceritaTextboxController.text = widget.produk.cerita;
      });
    } else {
      judul = "TAMBAH IKLAN";
      tombolSubmit = "SIMPAN";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(judul), backgroundColor: blueColor),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  _judulIklanTextField(),
                  _urlTextField(),
                  _danaNeedTextField(),
                  _danaCollectedTextField(),
                  _ceritaTextField(),
                  _buttonSubmit()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

//Membuat Textbox Kode Produk
  Widget _judulIklanTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Judul Iklan"),
      keyboardType: TextInputType.text,
      controller: _judulIklanTextboxController,
      validator: (value) {
        if (value.isEmpty) {
          return "Judul Iklan harus diisi";
        }
        return null;
      },
    );
  }

//Membuat Textbox Nama Produk
  Widget _urlTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "URL gambar"),
      keyboardType: TextInputType.text,
      controller: _urlTextboxController,
      validator: (value) {
        if (value.isEmpty) {
          return "URL Gambar harus diisi";
        }
        return null;
      },
    );
  }

//Membuat Textbox Harga Produk
  Widget _danaNeedTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Dana Diperlukan"),
      keyboardType: TextInputType.number,
      controller: _danaNeedTextboxController,
      validator: (value) {
        if (value.isEmpty) {
          return "Dana harus diisi";
        }
        return null;
      },
    );
  }

  Widget _danaCollectedTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Dana Terkumpul"),
      keyboardType: TextInputType.number,
      controller: _danaCollectedTextboxController,
      validator: (value) {
        if (value.isEmpty) {
          return "Dana harus diisi";
        }
        return null;
      },
    );
  }

  Widget _ceritaTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Cerita"),
      keyboardType: TextInputType.text,
      controller: _ceritaTextboxController,
      validator: (value) {
        if (value.isEmpty) {
          return "Cerita harus diisi";
        }
        return null;
      },
    );
  }

//Membuat Tombol Simpan/Ubah
  Widget _buttonSubmit() {
    return RaisedButton(
        child: Text(tombolSubmit),
        onPressed: () {
          var validate = _formKey.currentState.validate();
          if (validate) {
            if (!_isLoading) {
              if (widget.produk != null) {
//kondisi update produk
                ubah();
              } else {
//kondisi tambah produk
                simpan();
              }
            }
          }
        });
  }

  simpan() {
    setState(() {
      _isLoading = true;
    });
    Produk createProduk = new Produk();
    createProduk.judulIklan = _judulIklanTextboxController.text;
    createProduk.danaNeed = int.parse(_danaNeedTextboxController.text);
    createProduk.danaCollected =
        int.parse(_danaCollectedTextboxController.text);
    createProduk.url = _urlTextboxController.text;
    createProduk.cerita = _ceritaTextboxController.text;
    ProdukBloc.addProduk(produk: createProduk).then((value) {
      Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => AllContent()));
    }, onError: (error) {
      showDialog(
          context: context,
          builder: (BuildContext context) => WarningDialog(
                description: "Simpan gagal, silahkan coba lagi",
              ));
    });
    setState(() {
      _isLoading = false;
    });
  }

  ubah() {
    setState(() {
      _isLoading = true;
    });
    Produk updateProduk = new Produk();
    updateProduk.id = widget.produk.id;
    updateProduk.judulIklan = _judulIklanTextboxController.text;
    updateProduk.danaNeed = int.parse(_danaNeedTextboxController.text);
    updateProduk.danaCollected =
        int.parse(_danaCollectedTextboxController.text);
    updateProduk.cerita = _ceritaTextboxController.text;
    ProdukBloc.updateProduk(produk: updateProduk).then((value) {
      Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => AllContent()));
    }, onError: (error) {
      showDialog(
          context: context,
          builder: (BuildContext context) => WarningDialog(
                description: "Permintaan ubah data gagal, silahkan coba lagi",
              ));
    });
    setState(() {
      _isLoading = false;
    });
  }
}
