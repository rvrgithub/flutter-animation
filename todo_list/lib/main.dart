import 'package:flutter/material.dart';
import 'package:part_1/todo_model.dart';
import 'package:part_1/todo_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_)=>TodoModel(),child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 138, 97, 208)),
        useMaterial3: true,
      ),
      home:  TodoScreen(),
    ),);
  }
}
