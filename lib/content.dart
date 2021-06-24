import 'package:flutter/material.dart';
import 'package:submission_flutter_pemua/pages/iklan_page.dart';
import 'package:submission_flutter_pemua/theme.dart';

class AllContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iklan Donasi'),
        backgroundColor: blueColor,
      ),
      body: IklanPage(),
    );
  }
}
