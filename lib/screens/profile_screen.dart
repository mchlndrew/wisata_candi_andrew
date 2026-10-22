import 'package:flutter/material.dart';
 
class ProfileScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // TODO: 1. Deklarasikan variabel

  bool isSignedIn = false;
  String fullName = '';
  String userName = '';
  int favoriteCandiCount = 0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.deepPurple,
      ),
      Column(
        children: [
              // TODO: 2. Buat ProfileHeader
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 200 - 50
                  ),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.deepPurple,
                              width: 2,
                            )
                        ),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('Images/placholder_image.png'),
                        ),
                      ),
                      if (isSignedIn)
                        IconButton(
                          onPressed: (){},
                          icon: Icon(
                            Icons.camera_alt,
                            color: Colors.deepPurple,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              // TODO: 3. Buat ProfileInfo
              Row(children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: const Row(children: [
                    Icon(Icons.person, color: Colors.blue),
                    SizedBox(width: 8),
                    Text('Pengguna', style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                  ]),
                  
                ),
                Expanded(
                  child: Text(': $fullName',
                      style: const TextStyle(fontSize: 18)),
                ),
              ]),

              Row(children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: const Row(children: [
                    Icon(Icons.lock, color: Colors.amber),
                    SizedBox(width: 8),
                    Text('kunci',
                        style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                  ]),
                ),
                Expanded(
                  child: Text(': $userName',
                      style: const TextStyle(fontSize: 18)),
                ),
              ]),

              Row(children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: const Row(children: [
                    Icon(Icons.favorite, color: Colors.red),
                    SizedBox(width: 8),
                    Text('Favorite',
                        style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                  ]),
                ),
                Expanded(
                  child: Text(': $userName',
                      style: const TextStyle(fontSize: 18)),
                ),
              ]),
              // TODO: 4. Buat ProfileActions
            ],
      )
        ],
      ),
    );
  }
}
