import 'package:flutter/material.dart';
import 'package:quaran_kareem/model/suar.dart';
import 'package:quaran_kareem/widget/suracard.dart';

import 'model/suramodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Juz Amma '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  //String ?title;
 // String ?subtitle;
 // String? audio;
  //bool ?isPlaying;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: suar.length,
          itemBuilder: (context,index){
         return SuraCard(suar[index].title, suar[index].subtitle, index, suar.length);
          })


    )

    ;
  }
}
