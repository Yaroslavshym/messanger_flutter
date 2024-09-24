import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:messanger_flutter/pages/intro_page/intro_page.dart';
import 'package:messanger_flutter/pages/intro_page/intro_page_provider.dart';
import 'package:messanger_flutter/pages/main_page/main_page.dart';
import 'package:messanger_flutter/pages/main_page/main_page_provider.dart';
import 'package:messanger_flutter/theme/current_theme_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationDocumentsDirectory();

  Hive.init(dir.path);
  await Hive.openBox('myBox');
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
      // providers
      providers: [
        ChangeNotifierProvider(
          create: (context) => CurrentThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CurrentThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => IntroPageProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MainPageProvider(),
        ),
      ],

      // app
      child: MaterialApp(
        initialRoute: '/IntroPage',
        routes: {
          '/IntroPage': (context) => IntroPage(),
          '/MainPage': (context) => MainPage(),
          // '/IntroPage': (context) => IntroPage(),
        },
      ),
    );
  }
}
