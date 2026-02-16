import 'package:android_tv_remote/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import "data/tv_apps.dart";

class TvAppsPage extends StatelessWidget {
  final Future<void> Function(String deepLink)? launchApp;
  const TvAppsPage({super.key, required this.launchApp});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final double divider = height * 0.03;
    final double paddingInline = width * 0.07;
    return Scaffold(
      backgroundColor: AppColors.accent,
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
        backgroundColor: AppColors.accent,
      ), // Transparent dark overlay
      body: Padding(
        padding: EdgeInsets.all(paddingInline),
        child: Column(
          children: [
            SearchBar(
              hintText: 'Search',
              leading: Icon(Icons.search, color: Colors.white),
              backgroundColor: WidgetStateProperty.all(AppColors.box),
              padding: WidgetStateProperty.all(
                EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              ),
            ),
            SizedBox(height: divider),
            Expanded(
              child: SingleChildScrollView(
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
            ),
          ],
        ),
      ),
    );
  }
}
