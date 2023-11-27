// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:bloc_pattern_flutter_ornek/cubit/homepage_cubit.dart';
import 'package:flutter/material.dart';


class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  var Name = TextEditingController();
  var Phone = TextEditingController();
  Future<void> kaydet(String name, String phone) async {
    print('name: $name, phone: $phone');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Signup',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 50, right: 50, top: 20, bottom: 20),
          child: Column(
            children: [
              TextField(
                controller: Name,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.phone,
                controller: Phone,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                  hintText: 'Phone',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  kaydet(Name.text, Phone.text);
                  AnasayfaCubit().kisiEkle(Name.text, Phone.text);
                  if (MyAppStates().isError = true) {
                   
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text("Failed to add Person"),
                      action: SnackBarAction(
                        label: "Dismiss",
                        onPressed: () {

                        },
                      ),
                    ),
                  );
                  }else{
                     ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text("Person Added"),
                        action: SnackBarAction(
                          label: "Dismiss",
                          onPressed: () {

                          },
                        ),
                      ),
                    );
                  }
                },
                child: const Text('Sign Up!'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
