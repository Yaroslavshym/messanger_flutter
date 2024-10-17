import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:messanger_flutter/config/theme/current_theme_provider.dart';
import 'package:messanger_flutter/features/messenger/domain/entities/chat_entity.dart';
import 'package:messanger_flutter/features/messenger/presentetion/pages/create_chat.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'features/auth/presentation/pages/intro_page.dart';
import 'features/auth/presentation/provider/intro_page_provider.dart';
import 'features/messenger/domain/usecases/chat_usecases.dart';
import 'features/messenger/presentetion/pages/chat_page.dart';
import 'features/messenger/presentetion/pages/main_page.dart';
import 'features/messenger/presentetion/provider/main_page_provider.dart';
import 'firebase_options.dart';

ChatEntity someChat = ChatEntity(name: 'name');

Future<void> main() async {
  await WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationDocumentsDirectory();

  Hive.init(dir.path);
  await Hive.openBox('myBox');

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // ChatEntity chat = await ChatUseCases()
  //     .getChat(uuid: '123e4567-e89b-12d3-a456-426614174000');
  // log('$chat');
  // chat.name = 'new name';
  // ChatUseCases().updateChat(chat: chat);

  // await ChatUseCases().createChat(chat: chat);
  // await ChatUseCases().updateChat(chat: chat);
  someChat = (await ChatUseCases().getChats())[1];

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
        initialRoute: '/ChatPage',
        routes: {
          // Auth
          '/IntroPage': (context) => IntroPage(),

          // Messanger
          '/MainPage': (context) => MainPage(),
          '/CreateChat': (context) => CreateChat(),
          '/ChatPage': (context) => ChatPage(chat: someChat),
        },
      ),
    );
  }
}
