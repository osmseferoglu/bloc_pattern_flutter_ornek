// ignore_for_file: avoid_print
import 'package:bloc_pattern_flutter_ornek/cubit/homepage_cubit.dart';
import 'package:bloc_pattern_flutter_ornek/entity/person.dart';
import 'package:bloc_pattern_flutter_ornek/views/person_Signup.dart';
import 'package:bloc_pattern_flutter_ornek/views/person_detail.dart';
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
      appBar: AppBar(
          title: const Text(
        "Kişiler Bloc Uygulaması",
        style: TextStyle(color: Colors.white),
      )),
      body: BlocBuilder<AnasayfaCubit, List<Kisi>>(
        builder: (context, kisiListesi) {
          if (kisiListesi.isNotEmpty) {
            return ListView.builder(
              itemCount: kisiListesi.length,
              itemBuilder: (context, index) {
                var kisi = kisiListesi[index];
                return ListTile(
                    title: Text(kisi.kisi_ad),
                    subtitle: Text(kisi.kisi_tel),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      //Navigation to DetailPage
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DetailPage(),
                            settings: RouteSettings(arguments: kisi),
                          ));
                    });
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignupView()));
          },
          child: const Icon(Icons.add)),
    );
  }
}
