import 'package:flutter/material.dart';
import 'package:wisata_candi_drewww/data/candi_data.dart';
import 'package:wisata_candi_drewww/models/candi.dart';
import 'package:wisata_candi_drewww/screens/search_screen.dart';

class SearchScreen extends StatefulWidget{
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
} 

class _SearchScreenState extends State<SearchScreen> {
  // TODO 1 Deklarasikan Variabel Yang dibutuhkan
    // List<Candi> _filteredCandis = [];
    List<Candi> _filteredCandis = List<Candi>.from(candiList);
    String _searchQuery = '';
    final TextEditingController _searchController =TextEditingController();
    
    @override
    void initState() {
      super.initState();
    }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      // 2 buat appbar dengan judul pencarian 
      appBar : AppBar(title: Text('Pencarian Candi'),),
      // todo 3 buat body berupa column
       body: Column(
        children: [
          // TODO: 4. Buat TextField pencarian sebagai anak dari Column
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple[50],
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                autofocus: false,
                decoration: InputDecoration(
                  hintText: 'Cari candi',
                  prefixIcon: const Icon(Icons.search),
                  border: InputBorder.none,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
            ),
          ),

          //5. buat listview hasil pencarian sebagai anak dari column 
          Expanded(
            child: ListView.builder(
              itemCount: _filteredCandis.length,
              itemBuilder: (context, index) {
                final candi = _filteredCandis[index];
                
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Container + ClipRRect + Image
                      Container(
                        padding: const EdgeInsets.all(8),
                        width: 100,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            candi.imageAsset,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Padding + Column + Text (Nama & Lokasi)
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                candi.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                candi.location,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      )
    );

  }
}