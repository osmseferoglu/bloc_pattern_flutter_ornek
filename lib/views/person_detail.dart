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
          title: Text(
            person.kisi_ad,
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
            Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name: ${person.kisi_ad}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    'Tel No: ${person.kisi_tel}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),)
            
          ],
        ));
  }
}
