import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Search Button Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SearchButtonDemo(),
    );
  }
}

class SearchButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Button Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Fungsi untuk menangani ketika tombol pencarian ditekan
            // Anda dapat menambahkan logika untuk menavigasi ke halaman pencarian atau melakukan tindakan pencarian di sini
            print('Tombol pencarian ditekan');
          },
          child: Text('Cari'),
        ),
      ),
    );
  }
}
