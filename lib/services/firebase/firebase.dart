import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
}
