import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:my_app/CRUD.dart';
import 'package:my_app/components/auth_wrapper.dart';
import 'package:my_app/cubit/auth/cubit/auth_cubit.dart';
import 'package:my_app/cubit/balance/cubit/balance_cubit.dart';
import 'package:my_app/cubit/counter_cubit.dart';
import 'package:my_app/screens/category.dart';
import 'package:my_app/screens/data_screen.dart';
import 'package:my_app/screens/drawer.dart';
import 'package:my_app/screens/home_screen.dart';
import 'package:my_app/screens/login_screen.dart';
import 'package:my_app/screens/routes/BalanceScreen/balance_screen.dart';
import 'package:my_app/screens/routes/SecondScreen/second_screen.dart';
import 'package:my_app/screens/routes/SpendingScreen/spending_screen.dart';
import 'package:my_app/screens/routes/about_us.dart';
import 'package:my_app/screens/routes/angga_screen.dart';
import 'package:my_app/screens/routes/counter_screen.dart';
import 'package:my_app/screens/routes/custom_screen.dart';
import 'package:my_app/screens/routes/customer_service.dart';
import 'package:my_app/screens/routes/kategori/BULELENG.dart';
import 'package:my_app/screens/routes/kategori/BADUNG.dart';
import 'package:my_app/screens/routes/kategori/JEMBRANA.dart';
import 'package:my_app/screens/routes/welcome_screen.dart';
import 'package:my_app/screens/search_screen.dart';
import 'package:my_app/screens/setting_screen.dart';
import 'package:my_app/screens/profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterCubit>(create: (context) => CounterCubit()),
        BlocProvider<BalanceCubit>(create:(context) => BalanceCubit()),
        BlocProvider<AuthCubit>(create: (context) => AuthCubit()),
      ], 
      child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      home: const MyHomePage(title: 'DewatAnv'),
      routes: {
        '/second-screen':(context) => const SecondScreen(),
        '/profil-screen':(context) => const ProfileScreen(),
        '/custom-screen':(context) => const CustomScreen(),
        '/angga-screen':(context) => const AnggaScreen(),
        '/setting-screen':(context) => const SettingScreen(),
        '/home-screen':(context) => const HomeScreen(),
        '/login':(context) => const LoginPage(),
        '/search':(context) => SearchButtonDemo(),
        '/CRUD':(context) => const CrudSQLScreen(),
        '/datascreen':(context) => const DatasScreen(),
        '/customerservice':(context) => const CustomerServiceScreen(),
        '/about_us':(context) => const AboutUs(),
        '/counter-screen':(context) => const CounterScreen(),
        '/welcome-screen':(context) => const WelcomeScreen(),
        '/balance-screen':(context) => const AuthWrapper(child: BalanceScreen()),
        '/spending-screen':(context) => const AuthWrapper(child: SpendingScreen(),),
        '/home-page':(context) => const MyHomePage(title: 'DewatAnv')
      },
    ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  PageController _pageController = PageController();

  final List<Widget> _screens = [
    const HomeScreen(),
    const Category(),
    const ProfileScreen(),
  ];

  final List<String> _appBarTitles = const [
    'DewatAnv',
    'Category',
    'Profile',
  ]; // List of titles corresponding to each screen

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(index,
    duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _appBarTitles[_selectedIndex],
          style: GoogleFonts.pacifico(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 30, 129, 209),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: MyDrawer(
        username: 'Angga Pratama',
        backgroundImage: 'assets/images/A.png',
        color: Colors.white,
      ),
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 30, 129, 209),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category, size: 30),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 168, 168, 168),
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
