import 'package:ask4rent/core/global/colors.dart';
import 'package:ask4rent/core/global/fonts.dart';
import 'package:ask4rent/core/global/globals.dart';
import 'package:ask4rent/core/global/typography.dart';
import 'package:ask4rent/core/widgets/custom_appbar.dart';
import 'package:ask4rent/core/widgets/custom_divider.dart';
import 'package:ask4rent/core/widgets/custom_dropdown.dart';
import 'package:ask4rent/core/widgets/custom_textform.dart';
import 'package:ask4rent/feature/dashboard/dashboardPages/addProperty/controller/add_property_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPropertyView extends GetView<AddPropertyController> {
  const AddPropertyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'List Your Property'),
        body: SingleChildScrollView(
            child: Obx(
          () => Stepper(
              controlsBuilder: (context, details) => const SizedBox(),
              currentStep: controller.currentStep.value,
              type: StepperType.vertical,
              physics: const BouncingScrollPhysics(),
              onStepTapped: (step) {
                if (step == 1) {
                  if (controller.basicInfoFormKey.currentState!.validate()) {
                    return;
                  }
                  controller.currentStep.value < 1
                      ? controller.currentStep.value += 1
                      : null;
                } else if (step == 0) {
                  controller.currentStep.value > 0
                      ? controller.currentStep.value -= 1
                      : null;
                }
              },
              steps: [
                Step(
                    isActive: controller.currentStep.value >= 0,
                    state: controller.currentStep.value > 0
                        ? StepState.complete
                        : StepState.indexed,
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Basic Info *',
                          style: AppStyle.listPropHeading,
                        ),
                        const CustomDivider()
                      ],
                    ),
                    content: Form(
                        key: controller.basicInfoFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Property *',
                              style: AppStyle.listPropSubHeading,
                            ),
                            commonSpace1(),
                            CustomDropDown(
                                hintText: 'Select Property',
                                borderColor: lightBlack,
                                onChanged: (p0) {},
                                items: [
                                  'Residental Property',
                                  'Commercial Property',
                                  'PG Property',
                                ].map((e) {
                                  return DropdownMenuItem<String>(
                                      value: e,
                                      child: Text(e,
                                          style: TextStyle(
                                              color: lightBlack,
                                              fontFamily: alata,
                                              fontSize: 15)));
                                }).toList()),
                            commonSpace1(),
                            Text('Property-Type *',
                                style: AppStyle.listPropSubHeading),
                            commonSpace1(),
                            CustomDropDown(
                                hintText: 'Select Property-Type',
                                borderColor: lightBlack,
                                onChanged: (p0) {},
                                items: [
                                  'Appartment',
                                  'Shop',
                                  'Individual House',
                                  'Raw House',
                                  'Farm House',
                                  'Farm House',
                                ].map((e) {
                                  return DropdownMenuItem<String>(
                                      value: e,
                                      child: Text(e,
                                          style: TextStyle(
                                              color: lightBlack,
                                              fontFamily: alata,
                                              fontSize: 15)));
                                }).toList()),
                            commonSpace1(),
                            Text('City where your property located *',
                                style: AppStyle.listPropSubHeading),
                            commonSpace1(),
                            const CustomTextFormField(
                              hintText: 'Address',
                              borderRadius: 5,
                            ),
                            commonSpace1(),
                            Row(
                              children: const [
                                Expanded(
                                    child: CustomTextFormField(
                                        borderRadius: 5,
                                        hintText: 'House No.')),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: CustomTextFormField(
                                  hintText: 'PIN',
                                  borderRadius: 5,
                                  inputType: TextInputType.number,
                                ))
                              ],
                            ),
                            commonSpace1(),
                            const CustomTextFormField(
                              hintText: 'City',
                              borderRadius: 5,
                            ),
                            commonSpace1(),
                            const CustomTextFormField(
                              hintText: 'State',
                              borderRadius: 5,
                            ),
                            commonSpace1(),
                            Row(children:[
                              // Custom
                            ])
                          ],
                        ))),
                Step(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Property Details *',
                          style: TextStyle(
                              fontFamily: alata, fontSize: Get.width * 0.05),
                        ),
                        const CustomDivider()
                      ],
                    ),
                    content: Column(children: [
                      commonSpace1(),
                      Text('Area *', style: AppStyle.listPropSubHeading),
                      commonSpace1(),
                      const CustomTextFormField(
                        hintText: 'Area in Sqft',
                      ),
                    ]))
              ]),
        )));
  }
}
