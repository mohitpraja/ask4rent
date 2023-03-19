import 'dart:developer';

import 'package:ask4rent/core/routes.dart';
import 'package:ask4rent/core/widgets/custom_dialog.dart';
import 'package:ask4rent/core/widgets/custom_loader.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class Fbase {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseStorage storage = FirebaseStorage.instance;
  static Stream<DocumentSnapshot<Object>> profileStream(id) {
    return firestore.collection('users').doc(id).snapshots();
  }

  static Future createUser(name, email, password, phone) {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    var currDate = DateTime.now();
    String time = DateFormat('jm').format(currDate);
    String date = DateFormat('dd-MM-yyyy').format(currDate);
    return firestore.collection('users').doc(id).set({
      'name': name,
      'email': email,
      'post': '',
      'password': password,
      'phone': phone,
      'image': '',
      'id': id,
      'date': date,
      'time': time
    });
  }

  static Future login(phone, pass) async {
    CustomLoader().loader();
    bool isMatch = false;

    Box<dynamic> db = await Hive.openBox('ask4rent');
    firestore.collection('users').get().then((snapshot) {
      // ignore: avoid_function_literals_in_foreach_calls
      snapshot.docs.forEach(
        (e) async {
          Map<String, dynamic> data = e.data();
          if ((data['phone'] == phone || data['email'] == phone) &&
              data['password'] == pass) {
            isMatch = true;
            db.put('userId', data['id']);
            db.put('userInfo', {
              'name': data['name'],
              'email': data['email'],
              'password': data['password'],
              'id': data['id'],
              'image': data['image'],
              'phone': data['phone'],
            });
            db.put('isLogin', true);
          }
        },
      );
    }).then((value) {
      Get.back();
      if (isMatch) {
        isMatch = false;
        Get.offAllNamed(Routes.dashboard);
      } else {
        Get.back();
        CustomDialog(descText: 'Invalid Creadentials').warning();
      }
    });
  }

  static Future updateUserInfo(
    id,
    name,
    email,
  ) async {
    firestore.collection('users').doc(id).update({
      'name': name,
      'email': email,
    });
  }

  static Future uploadImage(
    file,
    id,
  ) async {
    print(file);
    print(id);
    final ext = file.path.split('.').last;
    final ref = storage.ref().child('users/profiles/$id.$ext');
    ref.putFile(file).then((p0) async {
      log('image status:${p0.bytesTransferred / 1000}');
      final imgUrl = await ref.getDownloadURL();
      print(imgUrl);
      firestore
          .collection('users')
          .doc(id)
          .update({'image': imgUrl}).then((value) async {
            Get.back();
        CustomDialog(
          descText: 'Image Updated',
          btnOkOnPress: () => Get.back(),
        ).success();
      });
    });
  }
}
