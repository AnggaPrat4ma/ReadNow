import 'package:flutter/material.dart';
import 'package:my_app/API.dart';
import 'package:my_app/CRUD.dart';
import 'package:my_app/screens/login_screen.dart';

class MyDrawer extends StatelessWidget {
  final String username;
  final String backgroundImage;

  MyDrawer({required this.username, required this.backgroundImage});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color.fromARGB(255, 244, 244, 244),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 34, 109, 222),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(backgroundImage),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          username,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.black),
              title: Text(
                'HOME',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/home-screen');
              },
            ),
            ListTile(
              leading: Icon(Icons.menu_book, color: Colors.black),
              title: Text(
                'ADD BOOK (Sqlite)',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => const CrudSQLScreen()),
                  ),
            ),
            ListTile(
              leading: Icon(Icons.menu_book, color: Colors.black),
              title: Text(
                'ADD BOOK (API)',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LongListScreen()),
                  ),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.book, color: Colors.black),
              title: Text(
                'BUKU PELAJARAN',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/pelajaran');
              },
            ),
            ListTile(
              leading: Icon(Icons.book, color: Colors.black),
              title: Text(
                'BUKU NOVEL',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/novel');
              },
            ),
            ListTile(
              leading: Icon(Icons.book, color: Colors.black),
              title: Text(
                'BUKU CERITA',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/cerita');
              },
            ),
            ListTile(
              leading: Icon(Icons.book, color: Colors.black),
              title: Text(
                'BUKU CODING',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/my-list-screen');
              },
            ),
            ListTile(
              leading: Icon(Icons.book, color: Colors.black),
              title: Text(
                'KOMIK',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/my-list-screen');
              },
            ),
            ListTile(
              leading: Icon(Icons.book, color: Colors.black),
              title: Text(
                'BUKU DONGENG',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/my-list-screen');
              },
            ),
            ListTile(
              leading: Icon(Icons.book, color: Colors.black),
              title: Text(
                'KAMUS',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/my-list-screen');
              },
            ),
            Divider(color: Colors.black),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.black),
              title: Text(
                'Account',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/account-screen');
              },
            ),
            ListTile(
              leading: Icon(Icons.help, color: Colors.black),
              title: Text(
                'Help Center',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/help-screen');
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.black),
              title: Text(
                'Sign Out',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => LoginPage()),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
