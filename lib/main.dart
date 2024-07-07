import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:messanger_flutter/pages/intro_page.dart';
import 'package:messanger_flutter/pages/main_mage.dart';
import 'package:messanger_flutter/providers/current_theme_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();

  Hive.init(dir.path);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => CurrentThemeProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => CurrentThemeProvider(),
          ),
        ],
        child: MaterialApp(
          onGenerateRoute: (setting) {
            if (setting.name == '/IntroPage') {
              return MaterialPageRoute(
                builder: (context) => IntroPage(),
              );
            } else if (setting.name == '/MenuPage') {
              return MaterialPageRoute(
                builder: (context) => const MainPage(),
              );
            } else {
              return MaterialPageRoute(
                builder: (context) => IntroPage(),
              );
            }
          },
        ));
  }
}
