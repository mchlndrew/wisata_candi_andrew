import 'package:flutter/material.dart';
import 'package:wisata_candi_drewww/data/candi_data.dart';
import 'package:wisata_candi_drewww/models/candi.dart';
import 'package:wisata_candi_drewww/widgets/item_card.dart';


class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: 1 Buat appbar dengan judul Wista Candi
      appBar: AppBar(title: Text ('Wisata Candi'),),
      //TODO: 2 Buat body dengan gridview.builder
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
        padding: EdgeInsets.all(8),
        itemCount: candiList.length,
        itemBuilder: (context, index) {
          final Candi candi = candiList [index];
          //TODO: 3 BUat ItemCard sebagai return value dari Gridview.builder
          return ItemCard (candi: candi);
        },
      ),


    );
  }
}