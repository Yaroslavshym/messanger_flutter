import 'package:flutter/material.dart';
import 'package:messanger_flutter/features/messenger/domain/usecases/chat_usecases.dart';
import 'package:messanger_flutter/features/messenger/presentetion/widgets/chat_widget.dart';
import 'package:provider/provider.dart';

import '../../../../config/theme/current_theme_provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CurrentThemeProvider themeProvider =
        Provider.of<CurrentThemeProvider>(context);
    return Scaffold(
        backgroundColor: themeProvider.primaryColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: themeProvider.secondaryColor,
          child: Icon(
            Icons.add,
            color: themeProvider.primaryColor,
          ),
        ),
        body: StreamBuilder(
            stream: ChatUseCases().alwaysGetChats(),
            builder: ((BuildContext context, AsyncSnapshot snapshot) {
              // print('${snapshot.data}');

              if (snapshot.data != null) {
                return ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Your Chats',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.05,
                    ),
                    SizedBox(
                      child: Column(
                        children: List.generate(snapshot.data.length, (index) {
                          print('222222 Creating...');
                          return Column(
                            children: [
                              ChatWidget(chat: snapshot.data[index]),
                              SizedBox(
                                height:
                                    MediaQuery.sizeOf(context).height * 0.05,
                              ),
                            ],
                          );
                        }),
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                    ),
                  ],
                );

                ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return ChatWidget(chat: snapshot.data[index]);
                  },
                );
              } else {
                return const Center(child: SizedBox()

                    //     CircularProgressIndicator(
                    //   color: Colors.white,
                    // )

                    );
              }
              // return SizedBox();
            }))

        //     ListView(
        //   children: [],
        // )
        );
  }
}
