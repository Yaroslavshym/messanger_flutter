import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:messanger_flutter/config/theme/current_theme_provider.dart';
import 'package:messanger_flutter/features/messenger/presentetion/pages/create_chat.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'features/auth/presentetion/pages/intro_page.dart';
import 'features/auth/presentetion/provider/intro_page_provider.dart';
import 'features/messenger/presentetion/pages/main_page.dart';
import 'features/messenger/presentetion/provider/main_page_provider.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationDocumentsDirectory();

  Hive.init(dir.path);
  await Hive.openBox('myBox');

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // ChatEntity chat = ChatEntity(participantsUuidList: [
  //   const Uuid().v4(),
  // ], name: 'name');
  // ChatUseCases().createNewChat(chat);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // providers
      providers: [
        // ChangeNotifierProvider(
        //   create: (context) => CurrentThemeProvider(),
        // ),
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
          // Auth
          '/IntroPage': (context) => IntroPage(),

          // Messanger
          '/MainPage': (context) => MainPage(),
          '/CreateChat': (context) => CreateChat(),
        },
      ),
    );
  }
}
