import 'dart:developer';
import 'dart:io';
import 'package:ask4rent/core/global/global_var.dart';
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
  static Stream<QuerySnapshot<Object?>> propertyStream =
      Fbase.firestore.collection('property').snapshots();
  static Stream<DocumentSnapshot<Object>> profileStream(id) {
    return firestore.collection('users').doc(id).snapshots();
  }

  static String post = '';

  static Future createUser(name, email, password, phone, post) {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    var currDate = DateTime.now();
    String time = DateFormat('jm').format(currDate);
    String date = DateFormat('dd-MM-yyyy').format(currDate);
    return firestore.collection('users').doc(id).set({
      'name': name,
      'email': email,
      'post': post,
      'password': password,
      'phone': phone,
      'image': '',
      'savedProperty': [],
      'id': id,
      'date': date,
      'time': time,
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
            post = data['post'];
            db.put('userId', data['id']);
            db.put('userInfo', {
              'name': data['name'],
              'email': data['email'],
              'post': data['post'],
              'password': data['password'],
              'id': data['id'],
              'image': data['image'],
              'phone': data['phone'],
              'savedProperty': data['savedProperty'],
            });
            db.put('isLogin', true);
          }
        },
      );
    }).then((value) {
      Get.back();
      if (isMatch) {
        isMatch = false;
        if (post == 'Admin') {
          log('post : $post');
          isMatch = false;
          Get.offAllNamed(Routes.adminHome);
        } else if (post == 'Executive') {
          log('post : $post');
          isMatch = false;
          Get.offAllNamed(Routes.executiveHome);
        } else {
          isMatch = false;
          Get.offAllNamed(Routes.dashboard);
        }
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
    final ext = file.path.split('.').last;
    final ref = storage.ref().child('users/profiles/$id.$ext');
    ref.putFile(file).then((p0) async {
      log('image status:${p0.bytesTransferred / 1000}');
      final imgUrl = await ref.getDownloadURL();
      firestore
          .collection('users')
          .doc(id)
          .update({'image': imgUrl}).then((value) async {
        Get.back();
        CustomDialog(
          descText: 'Image Updated',
          isDismissable: false,
          btnOkOnPress: () => Get.back(),
        ).success();
      });
    });
  }

  static RxBool isPhoneExist = false.obs;
  static RxBool isEmailExist = false.obs;

  static Future checkUser(phone, email) async {
    await firestore
        .collection('users')
        .where('phone', isEqualTo: phone)
        .get()
        .then((e) {
      if (e.docs.isNotEmpty) {
        isPhoneExist.value = true;
      } else {
        isPhoneExist.value = false;
      }
    });
    await firestore
        .collection('users')
        .where('email', isEqualTo: email)
        .get()
        .then((e) {
      if (e.docs.isNotEmpty) {
        isEmailExist.value = true;
      } else {
        isEmailExist.value = false;
      }
    });
  }

  static Future forgotPass(phone, password) async {
    String id = '';
    firestore.collection('users').get().then((snapshot) {
      // ignore: avoid_function_literals_in_foreach_calls
      snapshot.docs.forEach(
        (e) async {
          var data = e.data();
          if (data['phone'] == phone || data['eamil'] == phone) {
            id = data['id'];
          }
        },
      );
      firestore.collection('users').doc(id).update({'password': password});
    });
  }

  static Future addProperty(
    title,
    propertyType,
    address,
    houseNum,
    pin,
    city,
    state,
    area,
    furnishingStatus,
    propertyDescription,
    phone,
    email,
    rent,
    status
  ) async {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    var currDate = DateTime.now();
    String time = DateFormat('jm').format(currDate);
    String date = DateFormat('dd-MM-yyyy').format(currDate);
    log('img urls : $propertyImagesUrls');
    return firestore.collection('property').doc(id).set({
      'id': id,
      'date': date,
      'time': time,
      'title': title,
      'propertyType': propertyType,
      'address': address,
      'houseNum': houseNum,
      'pin': pin,
      'city': city,
      'state': state,
      'area': area,
      'furnishingStatus': furnishingStatus,
      'propertyDescription': propertyDescription,
      'phone': phone,
      'email': email ?? '',
      'rent': rent,
      'status':status,
      'isSaved': false,
      'houseImages': propertyImagesUrls
    });
  }

  static Future<List<String>?> uploadPropertyImages(images) async {
    if (images.isEmpty) return null;

    List<String> downloadUrls = [];

    await Future.forEach(images, (dynamic file) async {
      String id = DateTime.now().millisecondsSinceEpoch.toString();
      final ext = file.path.split('.').last;
      Reference ref = FirebaseStorage.instance
          .ref()
          .child('houses/${userInfo['id']}/$id.$ext');
      final UploadTask uploadTask = ref.putFile(File(file.path));
      final TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
      final url = await taskSnapshot.ref.getDownloadURL();
      downloadUrls.add(url);
    });
    propertyImagesUrls = downloadUrls;
    return downloadUrls;
  }
}
