import 'package:flutter/material.dart';
import 'package:my_app/screens/drawer.dart';

class Book {
  final String title;
  final String imageUrl;
  final String route;
  final String description;

  const Book({
    required this.title,
    required this.imageUrl,
    required this.route,
    required this.description,
  });
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List<Book> books = [
    Book(
      title: 'Sangkuriang',
      imageUrl: 'assets/images/sangkuriang.jpg',
      route: '/bookDetail?id=1',
      description: 'Description for Book 1.',
    ),
    Book(
      title: 'Si Kancil',
      imageUrl: 'assets/images/kancil.jpg',
      route: '/bookDetail?id=2',
      description: 'Description for Book 2.',
    ),
    Book(
      title: 'Happy Coding',
      imageUrl: 'assets/images/coding.jpeg',
      route: '/bookDetail?id=3',
      description: 'Description for Book 2.',
    ),
    Book(
      title: 'IPA',
      imageUrl: 'assets/images/ipa.png',
      route: '/bookDetail?id=4',
      description: 'Description for Book 2.',
    ),
    Book(
      title: 'Perahu Kertas',
      imageUrl: 'assets/images/perahu.jpg',
      route: '/bookDetail?id=5',
      description: 'Description for Book 2.',
    ),
    Book(
      title: 'Si Juki',
      imageUrl: 'assets/images/juki.jpg',
      route: '/bookDetail?id=6',
      description: 'Description for Book 2.',
    ),
    Book(
      title: 'Morfologi',
      imageUrl: 'assets/images/mor.jpg',
      route: '/bookDetail?id=6',
      description: 'Description for Book 2.',
    ),
    Book(
      title: 'Kamus',
      imageUrl: 'assets/images/kamus.jpg',
      route: '/bookDetail?id=6',
      description: 'Description for Book 2.',
    ),
    // Add more books
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ReadNow',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: books.length,
          itemBuilder: (context, index) {
            final book = books[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BookDetailScreen(book: book),
                ));
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(15),
                        ),
                        child: Image.asset(
                          book.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        book.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
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
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 2, 146, 218),
        elevation: 10,
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavBarItem(
                icon: Icons.home,
                text: 'Home',
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/home-screen');// Add your onTap functionality here
                },
              ),
              NavBarItem(
                icon: Icons.person,
                text: 'Profile',
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/profil-screen');// Add your onTap functionality here
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/search');
        },
        tooltip: 'Search',
        child: Icon(Icons.search),
      ),
    );
  }
}

class NavBarItem extends StatefulWidget {
  final IconData icon;
  final String text;
  final Function onTap;

  const NavBarItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  _NavBarItemState createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap();
      },
      onHover: (value) {
        setState(() {
          _isHovered = value;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: _isHovered ? Colors.blue[900] : Colors.transparent,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: [
            Icon(
              widget.icon,
              color: Colors.white,
            ),
            SizedBox(width: 8.0),
            Text(
              widget.text,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
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
