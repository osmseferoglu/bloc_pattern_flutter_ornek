import 'package:bloc_pattern_flutter_ornek/entity/person.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});
  final person = Kisi;

  @override
  Widget build(BuildContext context) {
    final person = ModalRoute.of(context)!.settings.arguments as Kisi;

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Detail",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ListView(
          children: [
            Image.network(
              "https://avatars.githubusercontent.com/u/47645376?v=4",
              fit: BoxFit.fill,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: Text(person.kisi_ad.toUpperCase(),
                  ),
                  subtitle: const Text("Name"),
                  onTap: (){

                  },
                  
            ),ListTile(
              leading: const Icon(Icons.phone),
              title: Text(
                person.kisi_tel,
              ),
              subtitle: const Text("Phone Number"),
              onTap: (){

              },
            )
            
          ],
        ));
  }
}
