import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends GetView{
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          const Text('this is splash'),
          ElevatedButton(onPressed: () {
            
          }, child: const Text('Text'))
        ],
      )
    );
  }

}