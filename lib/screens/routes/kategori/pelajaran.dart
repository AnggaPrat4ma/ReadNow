import 'package:flutter/material.dart';
import 'package:my_app/screens/drawer.dart';

class Book {
  final String title;
  final String imageUrl;
  final String route;
  final String description;
  final double rating;

  const Book({
    required this.title,
    required this.imageUrl,
    required this.route,
    required this.description,
    required this.rating,
  });
}

class Pelajaran extends StatefulWidget {
  const Pelajaran({Key? key}) : super(key: key);

  @override
  _PelajaranState createState() => _PelajaranState();
}

class _PelajaranState extends State<Pelajaran> {
  final List<Book> books = [
    const Book(
      title: 'BAHASA INDONESIA',
      imageUrl: 'assets/images/indo.jpeg',
      route: '/bookDetail?id=1',
      description: 'Description for Book 1.',
      rating: 4.5,
    ),
    const Book(
      title: 'BAHASA INGGRIS',
      imageUrl: 'assets/images/ing.jpeg',
      route: '/bookDetail?id=2',
      description: 'Description for Book 2.',
      rating: 4.0,
    ),
    const Book(
      title: 'BAHASA JEPANG',
      imageUrl: 'assets/images/jep.jpeg',
      route: '/bookDetail?id=3',
      description: 'Description for Book 3.',
      rating: 3.5,
    ),
    const Book(
      title: 'BAHASA BALI',
      imageUrl: 'assets/images/bali.jpeg',
      route: '/bookDetail?id=4',
      description: 'Description for Book 3.',
      rating: 4.5,
    ),
    const Book(
      title: 'IPA',
      imageUrl: 'assets/images/ipa.png',
      route: '/bookDetail?id=5',
      description: 'Description for Book 3.',
      rating: 3.5,
    ),
    const Book(
      title: 'IPS',
      imageUrl: 'assets/images/ips.jpeg',
      route: '/bookDetail?id=6',
      description: 'Description for Book 3.',
      rating: 3.0,
    ),
    const Book(
      title: 'SENI RUPA',
      imageUrl: 'assets/images/sr.jpeg',
      route: '/bookDetail?id=7',
      description: 'Description for Book 3.',
      rating: 4.5,
    ),
    const Book(
      title: 'MATEMATIKA',
      imageUrl: 'assets/images/mat.jpeg',
      route: '/bookDetail?id=8',
      description: 'Description for Book 3.',
      rating: 5.0,
    ),
    const Book(
      title: 'FISIKA',
      imageUrl: 'assets/images/fsk.jpeg',
      route: '/bookDetail?id=9',
      description: 'Description for Book 3.',
      rating: 3.0,
    ),
    const Book(
      title: 'KIMIA',
      imageUrl: 'assets/images/kim.jpeg',
      route: '/bookDetail?id=10',
      description: 'Description for Book 3.',
      rating: 4.5,
    ),
    // Add more books
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BUKU PELAJARAN',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: MyDrawer(
        username: 'Angga Pratama',
        backgroundImage: 'assets/images/angga.jpg',
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                book.imageUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(book.title),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow),
                    SizedBox(width: 5),
                    Text('${book.rating}'),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  book.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => BookDetailScreen(book: book),
              ));
            },
          );
        },
      ),
    );
  }
}

class BookDetailScreen extends StatelessWidget {
  final Book book;

  const BookDetailScreen({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            book.description,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
