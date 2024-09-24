import 'package:firebase_database/firebase_database.dart';

class RealtimeDatabaseStorage {
  Future<void> createChat({
    required Map data,
    required String stringRef,
  }) async {
    final ref = FirebaseDatabase.instance.ref(stringRef);
    await ref.set(data);
  }
}
