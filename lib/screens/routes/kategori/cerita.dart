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

class Cerita extends StatefulWidget {
  const Cerita({Key? key}) : super(key: key);

  @override
  _CeritaState createState() => _CeritaState();
}

class _CeritaState extends State<Cerita> {
  final List<Book> books = [
    Book(
      title: 'BAHASA INDONESIA',
      imageUrl: 'assets/images/sangkuriang.jpg',
      route: '/bookDetail?id=1',
      description: 'Description for Book 1.',
      rating: 4.5,
    ),
    Book(
      title: 'BAHASA INGGRIS',
      imageUrl: 'assets/images/kancil.jpg',
      route: '/bookDetail?id=2',
      description: 'Description for Book 2.',
      rating: 4.0,
    ),
    Book(
      title: 'BAHASA JEPANG',
      imageUrl: 'assets/images/coding.jpeg',
      route: '/bookDetail?id=3',
      description: 'Description for Book 3.',
      rating: 3.5,
    ),
    Book(
      title: 'BAHASA BALI',
      imageUrl: 'assets/images/coding.jpeg',
      route: '/bookDetail?id=4',
      description: 'Description for Book 3.',
      rating: 4.5,
    ),
    Book(
      title: 'IPA',
      imageUrl: 'assets/images/coding.jpeg',
      route: '/bookDetail?id=5',
      description: 'Description for Book 3.',
      rating: 3.5,
    ),
    Book(
      title: 'IPS',
      imageUrl: 'assets/images/coding.jpeg',
      route: '/bookDetail?id=6',
      description: 'Description for Book 3.',
      rating: 3.0,
    ),
    Book(
      title: 'SENI RUPA',
      imageUrl: 'assets/images/coding.jpeg',
      route: '/bookDetail?id=7',
      description: 'Description for Book 3.',
      rating: 4.5,
    ),
    Book(
      title: 'MATEMATIKA',
      imageUrl: 'assets/images/coding.jpeg',
      route: '/bookDetail?id=8',
      description: 'Description for Book 3.',
      rating: 5.0,
    ),
    Book(
      title: 'FISIKA',
      imageUrl: 'assets/images/coding.jpeg',
      route: '/bookDetail?id=9',
      description: 'Description for Book 3.',
      rating: 3.0,
    ),
    Book(
      title: 'KIMIA',
      imageUrl: 'assets/images/coding.jpeg',
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
          'BUKU CERITA',
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
