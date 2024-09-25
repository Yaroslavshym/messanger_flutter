import 'package:firebase_database/firebase_database.dart';

class RealtimeDatabaseStorage {
  String fixdataInternalPath(String dataInternalPath) {
    dataInternalPath = dataInternalPath[0] == '/'
        ? dataInternalPath.substring(1)
        : dataInternalPath;
    return dataInternalPath;
  }

  String databaseUrl =
      'https://messanger-flutter-e2276-default-rtdb.europe-west1.firebasedatabase.app/';
  Future<void> putData({
    required data,
    required String dataInternalPath,
  }) async {
    dataInternalPath = fixdataInternalPath(dataInternalPath);
    final ref = FirebaseDatabase.instance.ref('$databaseUrl$dataInternalPath');
    ref.set(data);
  }

  Future<void> updateData({
    required data,
    required String dataInternalPath,
  }) async {
    dataInternalPath = fixdataInternalPath(dataInternalPath);
    final ref = FirebaseDatabase.instance.ref('$databaseUrl$dataInternalPath');
    ref.set(data);
  }

  Stream<Object?> listenData({
    required String dataInternalPath,
  }) async* {
    dataInternalPath = fixdataInternalPath(dataInternalPath);
    final ref = FirebaseDatabase.instance.ref('$databaseUrl$dataInternalPath');
    Object? data;
    ref.onValue.listen((DatabaseEvent event) {
      data = event.snapshot.value;
    });
    yield data;
  }

  // TODO:create read() func

  // use that later for other funtions
  // Future<void> createChat({
  //   required Map data,
  //   required String stringRef,
  // }) async {
  //   final ref = FirebaseDatabase.instance.ref(stringRef);
  //   await ref.set(data);
  // }
}
