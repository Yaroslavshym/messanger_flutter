import 'package:firebase_database/firebase_database.dart';

class RealtimeDatabaseStorage {
  String fixDataInternalPath(String dataInternalPath) {
    while (dataInternalPath[dataInternalPath.length - 1] == '/') {
      dataInternalPath =
          dataInternalPath.substring(0, dataInternalPath.length - 1);
    }

    // dataInternalPath = dataInternalPath[0] == '/'
    //     ? dataInternalPath.substring(1)
    //     : dataInternalPath;
    return dataInternalPath;
  }

  // String databaseUrl =
  //     'https://messanger-flutter-e2276-default-rtdb.europe-west1.firebasedatabase.app/';
  Future<void> putData({
    required data,
    required String dataInternalPath,
  }) async {
    try {
      print('data to be sent $data');
      dataInternalPath = fixDataInternalPath(dataInternalPath);
      final ref = FirebaseDatabase.instance.ref('$dataInternalPath');
      ref.set(data);
    } catch (e) {}
  }

  // Future<void> updateData({
  //   required data,
  //   required String dataInternalPath,
  // }) async {
  //   dataInternalPath = fixDataInternalPath(dataInternalPath);
  //   final ref = FirebaseDatabase.instance.ref('$dataInternalPath');
  //   ref.update(data);
  // }

  Stream<Map> listenData({
    required String dataInternalPath,
  }) async* {
    dataInternalPath = fixDataInternalPath(dataInternalPath);
    final ref = FirebaseDatabase.instance.ref('$dataInternalPath');
    Map data = {};
    ref.onValue.listen((DatabaseEvent event) {
      data = event.snapshot.value as Map;
    });

    yield data;
  }

  Future<Map> getData({
    required String dataInternalPath,
  }) async {
    dataInternalPath = fixDataInternalPath(dataInternalPath);
    final ref = FirebaseDatabase.instance.ref('$dataInternalPath');
    DataSnapshot data = await ref.get();

    return await data.value as Map;
  }

  // use that later for other funtions
  // Future<void> createChat({
  //   required Map data,
  //   required String stringRef,
  // }) async {
  //   final ref = FirebaseDatabase.instance.ref(stringRef);
  //   await ref.set(data);
  // }
}
