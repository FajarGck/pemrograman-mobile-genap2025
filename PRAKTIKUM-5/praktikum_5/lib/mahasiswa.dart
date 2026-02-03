import 'package:flutter/material.dart';

class MahasiswaPage extends StatefulWidget {
  const MahasiswaPage({super.key});

  @override
  State<MahasiswaPage> createState() => _MahasiswaPageState();
}

class _MahasiswaPageState extends State<MahasiswaPage> {
  List<Map<String, dynamic>> mahasiswa = [
    {
      "nim": "001",
      "nama": "CZ",
      "alamat": "Jln. Raya",
      "email": "cz@gmail.com",
      "img":
          "https://th.bing.com/th/id/OIP.rKjUTCis-Rki-TM6hyQfGAHaEK?rs=1&pid=ImgDetMain",
    },
    {
      "nim": "002",
      "nama": "Justin Sun",
      "alamat": "Jln. Raya",
      "email": "justin@gmail.com",
      "img":
          "https://th.bing.com/th/id/OIP.K1VLazPXHZaBMvUJuyCkUAHaE8?rs=1&pid=ImgDetMain",
    },
    {
      "nim": "003",
      "nama": "Keanu Reves",
      "alamat": "Jln. Raya",
      "email": "keanu@gmail.com",
      "img":
          "https://images.hellomagazine.com/horizon/square/821036cf20cd-keanu-reeves.jpg",
    },
    {
      "nim": "004",
      "nama": "Elon Musk",
      "alamat": "Jln. Raya",
      "email": "elon@gmail.com",
      "img":
          "https://th.bing.com/th/id/R.7f74cdafb3416c87fcf605e66f4c12fd?rik=20zeF75LZuhQ7Q&riu=http%3a%2f%2fwww.thefamouspeople.com%2fprofiles%2fimages%2felon-musk-1.jpg&ehk=bGWEbcsdoxqEEwaNuveQSXmdQ1%2b%2bOFWRbnwdiGtgLoM%3d&risl=&pid=ImgRaw&r=0",
    },
    {
      "nim": "005",
      "nama": "Emma Stone",
      "alamat": "Jln. Raya",
      "email": "ema@gmail.com",
      "img":
          "https://th.bing.com/th/id/OIP.Nu9qWtIeXMVp6pLdS4CV1gHaE8?rs=1&pid=ImgDetMain",
    },
    {
      "nim": "006",
      "nama": "Ben Zhao",
      "alamat": "Jln. Raya",
      "email": "Ben@gmail.com",
      "img":
          "https://th.bing.com/th/id/OIP.c1aSzzUBFTEmzOWdYFLLVwHaD4?w=299&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mahasiswa")),
      body: ListView.builder(
        itemCount: mahasiswa.length,
        itemBuilder:
            (context, index) => ListTile(
              leading: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: NetworkImage(mahasiswa[index]["img"]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(mahasiswa[index]["nama"]),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(mahasiswa[index]["nim"]),
                  Text(mahasiswa[index]["alamat"]),
                  Text(mahasiswa[index]["email"]),
                ],
              ),
            ),
      ),
    );
  }
}
