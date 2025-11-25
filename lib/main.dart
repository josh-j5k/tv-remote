import 'package:flutter/material.dart';
import 'package:remote_app/widgets/widget_tree.dart';
import 'package:remote_app/features/home/logic/observer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [routeObserver],
      title: 'Remote App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurpleAccent,
          brightness: Brightness.light,
        ),
      ),
      home: Scaffold(
        body: WidgetTree(), // Use HomePage as the main content
      ),
    );
  }
}
