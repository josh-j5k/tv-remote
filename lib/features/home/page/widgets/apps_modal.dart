import 'package:flutter/material.dart';
import "../../data/tv_apps.dart";

class AppsPage extends StatelessWidget {
  final Future<void> Function(String deepLink)? launchApp;
  const AppsPage({super.key, required this.launchApp});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final double divider = height * 0.03;
    final double paddingInline = width * 0.07;
    return Scaffold(
      backgroundColor: const Color.fromARGB(249, 7, 7, 21),
      appBar: AppBar(
        title: Text(
          "My Apps",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 28.0,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: CloseButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: Colors.white,
        ),
        backgroundColor: Color.fromARGB(249, 7, 7, 21),
      ), // Transparent dark overlay
      body: Padding(
        padding: EdgeInsets.all(paddingInline),
        child: Column(
          children: [
            SearchBar(
              hintText: 'Search',
              leading: Icon(Icons.search, color: Colors.white),
              backgroundColor: WidgetStateProperty.all(Colors.grey[900]),
              padding: WidgetStateProperty.all(
                EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              ),
            ),
            SizedBox(height: divider),
            Expanded(
              child: Column(
                children: tvApps.map((app) {
                  return Column(
                    children: [
                      ListTile(
                        leading: Image.asset(app.icon, width: 40, height: 40),
                        title: Text(
                          app.name,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        onTap: () {
                          launchApp?.call(app.deepLink);
                        },
                      ),
                      SizedBox(height: divider / 2),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
