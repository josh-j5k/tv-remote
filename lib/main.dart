import 'package:flutter/material.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurpleAccent,
          brightness: Brightness.light,
        ),
      ),
      home: Scaffold(
        body: Builder(
          builder: (context) {
            final darkColorScheme = Theme.of(context).colorScheme;
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              color: darkColorScheme.secondary,
              child: SafeArea(child: Column(children: [Text("hello")])),
            );
          },
        ),
      ),
    );
  }
}
