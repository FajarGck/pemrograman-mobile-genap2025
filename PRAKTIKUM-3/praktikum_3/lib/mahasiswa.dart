import 'package:flutter/material.dart';

class MahasiswaPage extends StatefulWidget {
  const MahasiswaPage({super.key});

  @override
  State<MahasiswaPage> createState() => _MahasiswaPageState();
}

class _MahasiswaPageState extends State<MahasiswaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mahasiswa")),
      body: ListView(
        children: [
          ListTile(
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                  image: NetworkImage(
                    "https://th.bing.com/th/id/OIP.RENI_0YtaT59s3uqXiQCmAHaE8?rs=1&pid=ImgDetMain",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text("23SA"),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Chang peng zhao"),
                Text("Jl. itu"),
                Text("091209102910291"),
              ],
            ),
          ),
          ListTile(
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://th.bing.com/th/id/OIP.RENI_0YtaT59s3uqXiQCmAHaE8?rs=1&pid=ImgDetMain',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text("0012"),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Emma Stone"),
                Text("Jl. disana"),
                Text("12810291029102"),
              ],
            ),
          ),
          ListTile(
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://th.bing.com/th/id/OIP.RENI_0YtaT59s3uqXiQCmAHaE8?rs=1&pid=ImgDetMain',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text("0012"),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Emma Stone"),
                Text("Jl. disana"),
                Text("12810291029102"),
              ],
            ),
          ),
          ListTile(
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://th.bing.com/th/id/OIP.RENI_0YtaT59s3uqXiQCmAHaE8?rs=1&pid=ImgDetMain',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text("0012"),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Emma Stone"),
                Text("Jl. disana"),
                Text("12810291029102"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
