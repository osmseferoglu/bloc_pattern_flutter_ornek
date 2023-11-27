// ignore_for_file: avoid_print
import 'package:bloc_pattern_flutter_ornek/cubit/homepage_cubit.dart';
import 'package:bloc_pattern_flutter_ornek/entity/person.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().kisileriYukle();
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
        appBar: AppBar(title: const Text("Kişiler Bloc Uygulaması")),
        body: BlocBuilder<AnasayfaCubit, List<Kisi>>(
          builder: (context, kisiListesi) {
            if (kisiListesi.isNotEmpty) {
              return ListView.builder(
                itemCount: kisiListesi.length,
                itemBuilder: (context, indeks) {
                  var kisi = kisiListesi[indeks];
                  return GestureDetector(
                    onTap: () {
                      print("tıklandı");
                    },
                    child: 
                    Padding(padding: EdgeInsets.all(8),child:
                    Row(children: [Text("${kisi.kisi_ad}"), Text(" ${kisi.kisi_tel}")]),)
                    ,
                    
                  );
                },
              );
            } else {
              return const Center();
            }
          },
        )
        );
  }
}
