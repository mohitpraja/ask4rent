import 'package:ask4rent/core/widgets/customdialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetView {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              CustomDialog(
                descText: 'adsfadsfdfasfsafasd',
               btnCancelOnPress: () {
                 
               },
               
              ).warning2();
            },
            child: const Text('Show')),
      ),
    );
  }
}
