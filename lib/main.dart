import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

final btnBgColor = Color.fromARGB(255, 18, 18, 18);
final btnTextColor = Color.fromARGB(255, 215, 215, 215);

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
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          color: Color.fromARGB(250, 0, 0, 9),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsGeometry.all(30.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "TV name",
                              style: TextStyle(
                                color: Color.fromARGB(255, 224, 224, 224),
                                fontSize: 20.0,
                              ),
                            ),
                            Text(
                              "Connected",
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: btnBgColor,
                                minimumSize: Size(40.0, 40.0),
                                padding: EdgeInsets.fromLTRB(25, 12, 25, 12),
                              ),
                              onPressed: () {},
                              child: Icon(
                                Icons.power_settings_new,
                                size: 30,
                                color: const Color.fromARGB(255, 255, 31, 98),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(
                                  255,
                                  18,
                                  18,
                                  18,
                                ),
                                minimumSize: Size(40, 40),
                                padding: EdgeInsets.fromLTRB(25, 12, 25, 12),
                              ),
                              onPressed: () {},
                              child: Icon(
                                Icons.settings,
                                size: 30,
                                color: btnTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              child: Column(
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: btnBgColor,
                                      minimumSize: Size(75.0, 48.0),
                                      padding: EdgeInsets.fromLTRB(
                                        0.0,
                                        15.0,
                                        0.0,
                                        15.0,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30.0),
                                          topRight: Radius.circular(30.0),
                                        ),
                                      ),
                                    ),

                                    onPressed: () {},
                                    child: Icon(
                                      Icons.keyboard_arrow_up,
                                      size: 30,
                                      color: btnTextColor,
                                    ),
                                  ),
                                  Container(
                                    color: btnBgColor,
                                    width: 75.0,
                                    child: Center(
                                      child: Text(
                                        "Ch",
                                        style: TextStyle(
                                          backgroundColor: btnBgColor,
                                          color: Colors.grey,
                                          height: 1.0,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: btnBgColor,
                                      minimumSize: Size(75.0, 48.0),
                                      padding: EdgeInsets.fromLTRB(
                                        0.0,
                                        15.0,
                                        0.0,
                                        15.0,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(30.0),
                                          bottomRight: Radius.circular(30.0),
                                        ),
                                      ),
                                    ),

                                    onPressed: () {},
                                    child: Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 30,
                                      color: btnTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                spacing: 15.0,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color.fromARGB(
                                        255,
                                        18,
                                        18,
                                        18,
                                      ),
                                      minimumSize: Size(40, 40),
                                      padding: EdgeInsets.fromLTRB(
                                        20,
                                        12,
                                        20,
                                        12,
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Icon(
                                      Icons.search,
                                      size: 30,
                                      color: btnTextColor,
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color.fromARGB(
                                        255,
                                        18,
                                        18,
                                        18,
                                      ),
                                      minimumSize: Size(40, 40),
                                      padding: EdgeInsets.fromLTRB(
                                        20.0,
                                        12,
                                        20.0,
                                        12,
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Icon(
                                      Icons.volume_mute_outlined,
                                      size: 30,
                                      color: btnTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              child: Column(
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: btnBgColor,
                                      minimumSize: Size(75.0, 48.0),
                                      padding: EdgeInsets.fromLTRB(
                                        0.0,
                                        15.0,
                                        0.0,
                                        15.0,
                                      ),

                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30.0),
                                          topRight: Radius.circular(30.0),
                                        ),
                                      ),
                                    ),

                                    onPressed: () {},
                                    child: Center(
                                      child: Icon(
                                        Icons.add,
                                        size: 30.0,
                                        color: btnTextColor,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    color: btnBgColor,
                                    width: 75.0,
                                    child: Center(
                                      child: Text(
                                        "Vol",
                                        style: TextStyle(
                                          backgroundColor: btnBgColor,
                                          color: Colors.grey,
                                          height: 1.0,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: btnBgColor,
                                      minimumSize: Size(75.0, 48.0),
                                      padding: EdgeInsets.fromLTRB(
                                        0.0,
                                        15.0,
                                        0.0,
                                        15.0,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(30.0),
                                          bottomRight: Radius.circular(30.0),
                                        ),
                                      ),
                                    ),

                                    onPressed: () {},
                                    child: Center(
                                      child: Icon(
                                        Icons.remove,
                                        size: 30.0,
                                        color: btnTextColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
