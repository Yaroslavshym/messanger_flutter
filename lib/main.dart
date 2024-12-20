import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:messanger_flutter/config/theme/current_theme_provider.dart';
import 'package:messanger_flutter/features/messenger/presentetion/pages/create_chat.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'features/auth/presentation/pages/intro_page.dart';
import 'features/auth/presentation/provider/intro_page_provider.dart';
import 'features/messenger/presentetion/pages/chat_page.dart';
import 'features/messenger/presentetion/pages/main_page.dart';
import 'features/messenger/presentetion/provider/main_page_provider.dart';
import 'firebase_options.dart';

Future<void> main() async {
  // Flutter
  await WidgetsFlutterBinding.ensureInitialized();

  // Hive
  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  await Hive.openBox('myBox');

  // Flutter
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // ChatEntity chat = await ChatUseCases()
  //     .getChat(uuid: '123e4567-e89b-12d3-a456-426614174000');
  // log('$chat');
  // chat.name = 'new name';
  // ChatUseCases().updateChat(chat: chat);
  // ChatEntity chat = ChatEntity(
  //   name: 'some chat',
  //   participantsUuidList: [Uuid().v4(), Uuid().v4()],
  //   messagesUuidList: [Uuid().v4(), Uuid().v4()],
  // );
  // await ChatUseCases().createChat(chat: chat);
  // await ChatUseCases().updateChat(chat: chat);
  // someChat = (await ChatUseCases().getChats())[1];
  // await MessageUseCases().createMessage(
  //     message: MessageEntity(
  //   senderUuid: '${Uuid().v4()}',
  //   receiverUuid: '${Uuid().v4()}',
  //   messageStatus: MessageStatus.sending,
  // ));
  // var listt = await MessageUseCases().getMessages();
  // for (var i = 0; i < listt.length; i++) {
  //   listt[i].printMessage();
  // }
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
        onGenerateRoute: (settings) {
          if (settings.name == '/ChatPage') {
            final args = settings.arguments as Map<String, dynamic>;
            final chat = args['chat'];
            return MaterialPageRoute(
              builder: (context) => ChatPage(chat: chat),
            );
          }
        },
        routes: {
          // Auth
          '/IntroPage': (context) => IntroPage(),

          // Messanger
          '/MainPage': (context) => MainPage(),
          '/CreateChat': (context) => CreateChat(),
          // '/ChatPage': (context) => ChatPage(chat: someChat),
        },
      ),
    );
  }
}
// MaterialApp(
// debugShowCheckedModeBanner: false,
// onGenerateRoute: (settings) {
// if (settings.name == '/IntroPage') {
// return MaterialPageRoute(
// builder: (context) => const IntroPage(),
// );
// } else if (settings.name == '/MenuPage') {
// return MaterialPageRoute(
// builder: (context) => const MenuPage(),
// );
// } else if (settings.name == '/ProductDescriptionPage') {
// final args = settings.arguments as Map<String, dynamic>;
// final product = args['product'];
//
// return MaterialPageRoute(
// builder: (context) => ProductDescriptionPage(product: product),
// );
// }
//
// return MaterialPageRoute(
// builder: (context) => const MenuPage(),
// );
// },
// initialRoute: '/IntroPage',
// ),
