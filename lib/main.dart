
import 'package:bloc_pattern_flutter_ornek/cubit/homepage_cubit.dart';
import 'package:bloc_pattern_flutter_ornek/views/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AnasayfaCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: Colors.blue
          )
        ),
      ),
    );
  }
}
