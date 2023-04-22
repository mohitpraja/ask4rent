import 'package:ask4rent/services/firebase/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class ExecutiveHomeController extends GetxController {
  @override
  Future<void> onInit() async {
    db = await Hive.openBox('ask4rent');
    userId = db.get('userId');
    super.onInit();
  }

  late Box<dynamic> db;
  String userId = '';
  Stream<QuerySnapshot<Object?>> profileStream =
      Fbase.firestore.collection('users').snapshots();
  List userList = [];
}
