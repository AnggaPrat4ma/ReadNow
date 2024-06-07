import 'package:flutter/material.dart';
import 'package:my_app/API.dart';
import 'package:my_app/CRUD.dart';
import 'package:my_app/screens/data_screen.dart';
import 'package:my_app/screens/routes/customer_service.dart';
import 'package:my_app/services/data_service.dart';
import 'package:my_app/utils/constants.dart';
import 'package:my_app/utils/secure_storage_util.dart';

class MyDrawer extends StatelessWidget {
  final String username;
  final String backgroundImage;

  MyDrawer({required this.username, required this.backgroundImage, required Color color});

  Future<void> doLogout(context) async {
  debugPrint("need logout");
  final response = await DataService.logoutData();
  if (response.statusCode == 200) {
    await SecureStorageUtil.storage.delete(key: tokenStoreName);
    Navigator.pushReplacementNamed(context, '/login');
  }
}

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        //
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
            ListTile(
              leading: Icon(Icons.group_sharp, color: Colors.black),
              title: Text(
                'CUSTOMER SUPPORT',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CustomerServiceScreen()),
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
              leading: const Icon(Icons.book, color: Colors.black),
              title: const Text(
                'BUKU NOVEL',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/novel');
              },
            ),
            ListTile(
              leading: const Icon(Icons.book, color: Colors.black),
              title: const Text(
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
                Navigator.pushNamed(context, '/counter-screen');
              },
            ),
            ListTile(
              leading: Icon(Icons.book, color: Colors.black),
              title: Text(
                'KOMIK',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DatasScreen()),
                  ),
            ),
            ListTile(
              leading: Icon(Icons.book, color: Colors.black),
              title: Text(
                'BUKU DONGENG',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/welcome-screen');
              },
            ),
            ListTile(
              leading: Icon(Icons.book, color: Colors.black),
              title: Text(
                'KAMUS',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/my-list-screen');
              },
            ),
            ListTile(
              leading: Icon(Icons.book, color: Colors.black),
              title: Text(
                'Balance Screen',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/balance-screen');
              },
            ),
            ListTile(
              leading: Icon(Icons.book, color: Colors.black),
              title: Text(
                'Spending Screen',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/spending-screen');
              },
            ),
            Divider(color: Colors.black),
            ListTile(
              leading: Icon(Icons.person, color: Colors.black),
              title: Text(
                'About Us',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/about_us');
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
              onTap: () {
                doLogout(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
