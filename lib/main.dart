import 'package:flutter/material.dart';
import 'package:my_app/CRUD.dart';
import 'package:my_app/screens/home_screen.dart';
import 'package:my_app/screens/login_screen.dart';
import 'package:my_app/screens/routes/SecondScreen/second_screen.dart';
import 'package:my_app/screens/routes/angga_screen.dart';
import 'package:my_app/screens/routes/custom_screen.dart';
import 'package:my_app/screens/routes/kategori/cerita.dart';
import 'package:my_app/screens/routes/kategori/novel.dart';
import 'package:my_app/screens/routes/kategori/pelajaran.dart';
import 'package:my_app/screens/search_screen.dart';
import 'package:my_app/screens/setting_screen.dart';
import 'package:my_app/screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      routes: {
        '/second-screen':(context) => const SecondScreen(),
        '/profil-screen':(context) => const ProfileScreen(),
        '/custom-screen':(context) => const CustomScreen(),
        '/angga-screen':(context) => const AnggaScreen(),
        '/setting-screen':(context) => const SettingScreen(),
        '/home-screen':(context) => const HomeScreen(),
        '/login':(context) => LoginPage(),
        '/search':(context) => SearchButtonDemo(),
        '/CRUD':(context) => const CrudSQLScreen(),
        '/pelajaran':(context) => const Pelajaran(),
        '/novel':(context) => const Novel(),
        '/cerita':(context) => const Cerita()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const ProfileScreen(),
  ];

  final List<String> _appBarTitles = const [
    'ReadNow',
    'My Profile',
  ]; // List of titles corresponding to each screen

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitles[_selectedIndex]),
      ),
      body: _screens[_selectedIndex],
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
