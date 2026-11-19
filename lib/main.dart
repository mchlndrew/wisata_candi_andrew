// import 'dart:nativewrappers/_internal/vm/lib/internal_patch.dart';

import 'package:flutter/material.dart';
import 'package:wisata_candi_drewww/data/candi_data.dart';
import 'package:wisata_candi_drewww/screens/detail_screen.dart';
import 'package:wisata_candi_drewww/screens/home_screen.dart';
import 'package:wisata_candi_drewww/screens/profile_screen.dart';
import 'package:wisata_candi_drewww/screens/sign_in_screen.dart';
import 'package:wisata_candi_drewww/screens/sign_up_screen.dart';
import 'package:wisata_candi_drewww/screens/search_screen.dart';
import 'package:wisata_candi_drewww/screens/home_screen.dart';
import 'package:wisata_candi_drewww/screens/favorite_screen.dart';
import 'package:provider/provider.dart';
import 'package:wisata_candi_drewww/providers/favorite_provider.dart';
import 'package:wisata_candi_drewww/providers/auth_provider.dart';




// void main() {
//   runApp(const MyApp());
// }
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Candi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      // home: DetailScreen(candi: candiList[0]),
      // home: const ProfileScreen(),
      // home : SignInScreen(),
      // home: const SearchScreen(),
      // home: HomeScreen(),
      // home : MainScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScreen(),
        '/homescreen': (context) => const HomeScreen(),
        '/signin': (context) => SignInScreen(),
        '/signup': (context) => const SignUpScreen(),
      },
    );
  }
}

class MainScreen extends StatefulWidget{
  const MainScreen ({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}
class _MainScreenState extends State <MainScreen> {
  /// todo 1 Deklarasikan  Variabel
  int _currentIndex = 0;
    
  final List<Widget> _children = [
    HomeScreen(),
    SearchScreen(),
    FavoriteScreen(),
    ProfileScreen(),
	];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: 2. Buat properti body berupa widget yang ditampilkan
      body: _children[_currentIndex],
      //TODO: 3. Buat properti bottomNavigationBar dengan nilai Theme
      bottomNavigationBar: Theme(
      // TODO: 4. Buat data dan child dari Theme
        data: Theme.of(context).copyWith(
          canvasColor: Colors.deepPurple[50]
        ), 
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.deepPurple),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.deepPurple),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite, color: Colors.deepPurple),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.deepPurple),
              label: 'Profile',
            ),
          ],
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.deepPurple[100],
          showUnselectedLabels: true,
        )
      ),
    );
  }
}
  
