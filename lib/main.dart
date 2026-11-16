import 'dart:nativewrappers/_internal/vm/lib/internal_patch.dart';

import 'package:flutter/material.dart';
import 'package:wisata_candi_drewww/data/candi_data.dart';
import 'package:wisata_candi_drewww/screens/detail_screen.dart';
import 'package:wisata_candi_drewww/screens/home_screen.dart';
import 'package:wisata_candi_drewww/screens/profile_screen.dart';
import 'package:wisata_candi_drewww/screens/sign_in_screen.dart';
import 'package:wisata_candi_drewww/screens/search_screen.dart';
import 'package:wisata_candi_drewww/screens/home_screen.dart';
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
    );
  }
  // class MainScreen extends StatefulWidget{
  //   const MainScreen ({super.key});

  //   @override
  //   State<MainScreen> createState() => _MainScreenState();
  // }
  // class _MainScreenState extends State <MainScreen> {

  // }
}
