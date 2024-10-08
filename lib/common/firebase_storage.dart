import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseStorage {
  static FirebaseFirestore _fireDBInstance() {
    return FirebaseFirestore.instance;
  }

  Future<void> setData(String key, List<String> value) async {
    _fireDBInstance();

    final reference = _fireDBInstance().collection("favourites").doc("user");

    await reference.set({"value": value});
  }

  Future<List<String>> getData(String key) async {
    _fireDBInstance();

    final reference = _fireDBInstance().collection("favourites").doc("user");

    try {
      final document = await reference.get().then((doc) {
        return doc.data();
      });

      final List<dynamic> value = document?['value'];

      return value.map((e)=>e.toString()).toList();
    } catch (e) {
      return [];
    }
  }

  Future<void> removeData(String key) async {
    _fireDBInstance();

    final reference = _fireDBInstance().doc("favourites");

    reference.delete();
  }
}
