import 'package:ask4rent/core/routes.dart';
import 'package:ask4rent/core/widgets/custom_dialog.dart';
import 'package:ask4rent/core/widgets/custom_loader.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class Fbase {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static FirebaseAuth auth = FirebaseAuth.instance;
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
}
