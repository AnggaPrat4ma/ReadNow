import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DENPASAR extends StatefulWidget {
  const DENPASAR({ Key? key }) : super(key: key);

  @override
  _DENPASARState createState() => _DENPASARState();
}

class _DENPASARState extends State<DENPASAR> {

  Widget _buildStarRating(int rating) {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          index < rating ? Icons.star : Icons.star_border,
          size: 16.0,
          color: Colors.amber,
        );
      }),
    );
  }

  final List<Map<String, dynamic>> videos = [
    {
      'thumbnail': 'assets/images/nusa dua.png',
      'title': 'Nusa Dua',
      'description': 'A beautiful view of nature.',
      'rating': 4,
    },
    {
      'thumbnail': 'assets/images/uluwatu.jpg',
      'title': 'Uluwatu',
      'description': 'The city illuminated at night.',
      'rating': 5,
    },
    {
      'thumbnail': 'assets/images/sanur.png',
      'title': 'Pantai Sanur',
      'description': 'Snowy mountains under a clear.',
      'rating': 3,
    },
    {
      'thumbnail': 'assets/images/museum.jpg',
      'title': 'Museum Bali',
      'description': 'Sunset over the ocean.',
      'rating': 4,
    },
    {
      'thumbnail': 'assets/images/museum.jpg',
      'title': 'Museum Bali',
      'description': 'Sunset over the ocean.',
      'rating': 4,
    },
    {
      'thumbnail': 'assets/images/museum.jpg',
      'title': 'Museum Bali',
      'description': 'Sunset over the ocean.',
      'rating': 4,
    },
    {
      'thumbnail': 'assets/images/museum.jpg',
      'title': 'Museum Bali',
      'description': 'Sunset over the ocean.',
      'rating': 4,
    },
    {
      'thumbnail': 'assets/images/museum.jpg',
      'title': 'Museum Bali',
      'description': 'Sunset over the ocean.',
      'rating': 4,
    },
    {
      'thumbnail': 'assets/images/museum.jpg',
      'title': 'Museum Bali',
      'description': 'Sunset over the ocean.',
      'rating': 4,
    },
    {
      'thumbnail': 'assets/images/museum.jpg',
      'title': 'Museum Bali',
      'description': 'Sunset over the ocean.',
      'rating': 4,
    },
    {
      'thumbnail': 'assets/images/tirta.png',
      'title': 'Tirta Empul',
      'description': 'A serene path through the forest.',
      'rating': 5,
    },
    {
      'thumbnail': 'assets/images/penglipuran.jpg',
      'title': 'Desa Penglipuran',
      'description': 'A vast desert landscape.',
      'rating': 2,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DENPASAR', style: GoogleFonts.pacifico()),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 2 / 2,
                ),
                itemCount: videos.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: videos[index]['thumbnail']!
                                  .startsWith('http')
                              ? Image.network(
                                  videos[index]['thumbnail']!,
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  videos[index]['thumbnail']!,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              videos[index]['title']!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          _buildStarRating(videos[index]['rating']),
                        ],
                      ),
                      Text(videos[index]['description']!),
                    ],
                  );
                },
              ),
            ),
          ],
        ),),
    );
  }
}