import 'package:ask4rent/core/widgets/custom_appbar.dart';
import 'package:ask4rent/feature/savedProperty/controller/saved_property_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SavedPropertyView extends GetView<SavedPropertyController> {
  const SavedPropertyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Saved Properties',titleSpacing: 15,),
    );
  }
}
