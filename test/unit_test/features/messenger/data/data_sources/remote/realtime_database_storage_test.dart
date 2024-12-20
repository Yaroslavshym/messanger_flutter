import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:messanger_flutter/features/messenger/data/data_sources/remote/realtime_database_storage.dart';

import '../../../../../../config/firebase_options_test.dart';

final RealtimeDatabaseStorage database = RealtimeDatabaseStorage();
Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  // WidgetsFlutterBinding.ensureInitialized();
  // init specifically for testing
  await Firebase.initializeApp(options: DefaultFirebaseOptionsTest.android);
  test('fix url', () {
    expect(database.fixDataInternalPath('https/abc.com/chat'),
        'https/abc.com/chat');
    expect(database.fixDataInternalPath('https/abc.com/chat/'),
        'https/abc.com/chat');
    expect(database.fixDataInternalPath('https/abc.com/chat//'),
        'https/abc.com/chat');
    expect(database.fixDataInternalPath('https/abc.com/chat/////'),
        'https/abc.com/chat');
  });
  // group('Crud for data storage', () {});
}

// void fixDataInternalPathTest(String dataInternalPath) {
//   expect(actual, matcher)
// }
//
// void putDataTest({
//   required data,
//   required String dataInternalPath,
// }) {}
// void getDataTest({
//   required String dataInternalPath,
// }) {}
