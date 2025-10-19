import 'package:flutter/material.dart';
import 'package:remote_app/features/home/logic/notifier.dart';
import 'package:remote_app/features/home/page/home_page.dart';
import 'package:remote_app/features/welcome/page/welcome_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final bool? isConnected = prefs.getBool('connected');
      appDataNotifier.value['isConnected'] = isConnected ?? false;
      if (!appDataNotifier.value['isConnected']) {
        Navigator.push(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(
            builder: (context) {
              return const WelcomeModal();
            },
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}
