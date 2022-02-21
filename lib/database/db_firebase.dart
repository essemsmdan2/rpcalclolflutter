import 'package:firebase_storage/firebase_storage.dart';

class DBFirestore {
  DBFirestore._();
  static final DBFirestore _instance = DBFirestore._();
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  static FirebaseStorage get() {
    return DBFirestore._instance._firebaseStorage;
  }
}
