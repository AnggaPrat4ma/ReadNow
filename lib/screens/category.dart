import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/screens/routes/kategori/BADUNG.dart';
import 'package:my_app/screens/routes/kategori/BANGLI.dart';
import 'package:my_app/screens/routes/kategori/BULELENG.dart';
import 'package:my_app/screens/routes/kategori/DENPASAR.dart';
import 'package:my_app/screens/routes/kategori/GIANYAR.dart';
import 'package:my_app/screens/routes/kategori/JEMBRANA.dart';
import 'package:my_app/screens/routes/kategori/KARANGASEM.dart';
import 'package:my_app/screens/routes/kategori/KLUNGKUNG.dart';
import 'package:my_app/screens/routes/kategori/TABANAN.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final List<Map<String, String>> videos = [
    {
      'thumbnail': 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Location_Badung_Regency.png/225px-Location_Badung_Regency.png',
      'title': 'BADUNG',
    },
    {
      'thumbnail': 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/de/Location_Buleleng_Regency.png/225px-Location_Buleleng_Regency.png',
      'title': 'BULELENG',
    },
    {
      'thumbnail': 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/Locator_Karangasem_Regency.png/225px-Locator_Karangasem_Regency.png',
      'title': 'KARANGASEM',
    },
    {
      'thumbnail': 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/be/Location_Jembrana_Regency.png/225px-Location_Jembrana_Regency.png',
      'title': 'JEMBRANA',
    },
    {
      'thumbnail': 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c6/Location_Gianyar_Regency.png/225px-Location_Gianyar_Regency.png',
      'title': 'GIANYAR',
    },
    {
      'thumbnail': 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/Location_Denpasar.png/225px-Location_Denpasar.png',
      'title': 'DENPASAR',
    },
    {
      'thumbnail': 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Location_Bangli_Regency.png/225px-Location_Bangli_Regency.png',
      'title': 'BANGLI',
    },
    {
      'thumbnail': 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Location_Klungkung_Regency.png/225px-Location_Klungkung_Regency.png',
      'title': 'KLUNGKUNG',
    },
    {
      'thumbnail': 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Location_Klungkung_Regency.png/225px-Location_Klungkung_Regency.png',
      'title': 'TABANAN',
    }
  ];

  void navigateToCategory(BuildContext context, String title) {
    switch (title) {
      case 'BULELENG':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BULELENG()),
        );
      break;
      case 'BADUNG':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BADUNG()),
        );
      break;
      case 'KARANGASEM':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const KARANGASEM()),
        );
      break;
      case 'BANGLI':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BANGLI()),
        );
      break;
      case 'GIANYAR':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const GIANYAR()),
        );
      break;
      case 'KLUNGKUNG':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const KLUNGKUNG()),
        );
      break;
      case 'JEMBRANA':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const JEMBRANA()),
        );
      break;
      case 'DENPASAR':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DENPASAR()),
        );
      break;
      case 'TABANAN':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const TABANAN()),
        );
      break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 1.0, // Make the aspect ratio 1:1 for square cards
            ),
            itemCount: videos.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => navigateToCategory(context, videos[index]['title']!),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(15.0)),
                          child: Image.network(
                            videos[index]['thumbnail']!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity, // Ensure the image fills the space
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent.withOpacity(0.1),
                          borderRadius: const BorderRadius.vertical(bottom: Radius.circular(15.0)),
                        ),
                        child: Text(
                          videos[index]['title']!,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.pacifico(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
