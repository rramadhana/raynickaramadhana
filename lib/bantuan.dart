import 'package:flutter/material.dart';

class bantuan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Penggunaan Aplikasi'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Tahap 1'),
            subtitle: Text('Membuka aplikasi dengan password dan username (admin)'),
          ),
          ListTile(
            title: Text('Tahap 2'),
            subtitle: Text('Memilih menu yang anda butuhkan'),
          ),
          ListTile(
            title: Text('Tahap 3'),
            subtitle: Text('Menu Log out terdapat pada icon log out sebelah kanan bawah untuk kembali ke menu login '),
          ),
          ListTile(
            title: Text('Tahap 4'),
            subtitle: Text('apabila terdapat kendala bisa menghubungi admin'),
          ),
        ],
      ),
    );
  }
}
