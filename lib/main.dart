import 'package:flutter/material.dart';
import 'package:neodocs/Presentations/Range/range_bloc.dart';
import 'package:neodocs/Presentations/Range/range_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Model/model.dart';
import 'entities/entities.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  final TestMetadata testMetadata = TestMetadata(
    sections: [
      SectionMetadata(start: 0, end: 30, color: Colors.red,),
      SectionMetadata(start: 30, end: 40, color: Colors.orange, ),
      SectionMetadata(start: 40, end: 60, color: Colors.green, ),
      SectionMetadata(start: 60, end: 70, color: Colors.orange, ),
      SectionMetadata(start: 70, end: 120, color: Colors.red, ),
    ],
  );
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  BlocProvider(
        create: (context) => RangeBloc(),
        child: RangeScreen(testMetadata: testMetadata,),
      ),
    );
  }
}


