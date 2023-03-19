import 'package:ask4rent/core/global/colors.dart';
import 'package:ask4rent/core/global/fonts.dart';
import 'package:ask4rent/core/global/globals.dart';
import 'package:ask4rent/core/global/typography.dart';
import 'package:ask4rent/core/global/validation.dart';
import 'package:ask4rent/core/localDB/cities.dart';
import 'package:ask4rent/core/widgets/custom_appbar.dart';
import 'package:ask4rent/core/widgets/custom_dropdown.dart';
import 'package:ask4rent/core/widgets/custom_elevatedbutton.dart';
import 'package:ask4rent/core/widgets/custom_outlinebutton.dart';
import 'package:ask4rent/core/widgets/custom_textform.dart';
import 'package:ask4rent/feature/dashboardPages/addProperty/controller/add_property_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPropertyView extends GetView<AddPropertyController> {
  const AddPropertyView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.focusScope!.unfocus(),
      child: Scaffold(
          appBar: const CustomAppBar(title: 'List Your Property'),
          body: Obx(
            () => Stepper(
                controlsBuilder: (context, details) => const SizedBox(),
                currentStep: controller.currentStep.value,
                type: StepperType.vertical,
                physics: const BouncingScrollPhysics(),
                onStepTapped: (step) {
                  if (step == 1) {
                    if (controller.basicInfoFormKey.currentState!.validate()) {
                      controller.currentStep.value < 1
                          ? controller.currentStep.value += 1
                          : null;
                    }
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
                                }).toList(),
                                validator: (value) =>
                                    isValid(value, 'Property Required'),
                              ),
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
                                }).toList(),
                                validator: (value) =>
                                    isValid(value, 'Property-type Required'),
                              ),
                              commonSpace1(),
                              Text('City where your property located *',
                                  style: AppStyle.listPropSubHeading),
                              commonSpace1(),
                              CustomTextFormField(
                                hintText: 'Address',
                                validator: (value) =>
                                    isValid(value, 'Address required'),
                              ),
                              commonSpace1(),
                              Row(
                                children: [
                                  Expanded(
                                      child: CustomTextFormField(
                                    hintText: 'House No.',
                                    validator: (value) =>
                                        isValid(value, 'House no. required'),
                                  )),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: CustomTextFormField(
                                    hintText: 'PIN',
                                    inputType: TextInputType.number,
                                    validator: (value) =>
                                        isValid(value, 'PIN required'),
                                  ))
                                ],
                              ),
                              commonSpace1(),
                              CustomTextFormField(
                                hintText: 'City',
                                validator: (value) =>
                                    isValid(value, 'City required'),
                              ),
                              commonSpace1(),
                              CustomDropDown(
                                hintText: 'State',
                                borderColor: lightBlack,
                                onChanged: (p0) {},
                                items: states.map((e) {
                                  return DropdownMenuItem<String>(
                                      value: e,
                                      child: Text(e,
                                          style: TextStyle(
                                              color: lightBlack,
                                              fontFamily: alata,
                                              fontSize: 15)));
                                }).toList(),
                                validator: (value) =>
                                    isValid(value, 'State required'),
                              ),
                              commonSpace1(),
                              CustomElevatedButton(
                                title: 'Next',
                                onPress: () {
                                  if (controller.basicInfoFormKey.currentState!
                                      .validate()) {
                                    controller.currentStep.value < 1
                                        ? controller.currentStep.value += 1
                                        : null;
                                  }
                                },
                              )
                            ],
                          ))),
                  Step(
                      isActive: controller.currentStep.value > 1,
                      state: controller.currentStep.value > 1
                          ? StepState.complete
                          : StepState.indexed,
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Property Details *',
                            style: TextStyle(
                                fontFamily: alata, fontSize: Get.width * 0.05),
                          ),
                        ],
                      ),
                      content: Form(
                        key: controller.propertyDetailsFormKey,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Area *',
                                  style: AppStyle.listPropSubHeading),
                              commonSpace1(),
                              CustomTextFormField(
                                inputType: TextInputType.number,
                                hintText: 'Area in Sqft',
                                validator: (value) =>
                                    isValid(value, 'Area required'),
                              ),
                              commonSpace1(),
                              Text('Furnishing Status *',
                                  style: AppStyle.listPropSubHeading),
                              commonSpace1(),
                              CustomDropDown(
                                hintText: 'Furnishing Status',
                                borderColor: lightBlack,
                                onChanged: (p0) {},
                                items: [
                                  'Unfurnished',
                                  'Semi-furnished',
                                  'Fully-furnished',
                                ].map((e) {
                                  return DropdownMenuItem<String>(
                                      value: e,
                                      child: Text(e,
                                          style: TextStyle(
                                              color: lightBlack,
                                              fontFamily: alata,
                                              fontSize: 15)));
                                }).toList(),
                                validator: (value) => isValid(
                                    value, 'Furnishing Stauts required'),
                              ),
                              commonSpace1(),
                              Text('Property Description *',
                                  style: AppStyle.listPropSubHeading),
                              commonSpace1(),
                              CustomTextFormField(
                                hintText: 'Add Property Details',
                                maxLines: 5,
                                contentPadding: const EdgeInsets.all(10),
                                validator: (value) => isValid(
                                    value, 'Property Descripty required'),
                              ),
                              commonSpace1(),
                              Row(
                                children: [
                                  CustomOutlineButton(
                                    onPress: () {
                                      controller.currentStep.value = 0;
                                    },
                                    title: 'Back',
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  CustomElevatedButton(
                                    title: 'Next',
                                    onPress: () {
                                      if (controller
                                          .propertyDetailsFormKey.currentState!
                                          .validate()) {
                                        controller.currentStep.value < 2
                                            ? controller.currentStep.value += 1
                                            : null;
                                      }
                                    },
                                  )
                                ],
                              )
                            ]),
                      )),
                  Step(
                      isActive: controller.currentStep.value >= 2,
                      state: controller.currentStep.value > 2
                          ? StepState.complete
                          : StepState.indexed,
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Contact Details *',
                            style: TextStyle(
                                fontFamily: alata, fontSize: Get.width * 0.05),
                          ),
                        ],
                      ),
                      content: Form(
                        key: controller.contactDetailsFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Contact Number *',
                                style: AppStyle.listPropSubHeading),
                            commonSpace1(),
                            CustomTextFormField(
                              hintText: 'Contact Number',
                              inputType: TextInputType.number,
                              maxLength: 10,
                              validator: (value) =>
                                  isValid(value, 'Contact Number required'),
                            ),
                            commonSpace1(),
                            Text('Email Address',
                                style: AppStyle.listPropSubHeading),
                            commonSpace1(),
                            const CustomTextFormField(
                              hintText: 'Email Address',
                              inputType: TextInputType.emailAddress,
                            ),
                            commonSpace1(),
                            Row(
                              children: [
                                CustomOutlineButton(
                                  onPress: () {
                                    controller.currentStep.value -= 1;
                                  },
                                  title: 'Back',
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                CustomElevatedButton(
                                  title: 'Next',
                                  onPress: () {
                                    if (controller
                                        .propertyDetailsFormKey.currentState!
                                        .validate()) {
                                      controller.currentStep.value < 3
                                          ? controller.currentStep.value += 1
                                          : null;
                                    }
                                  },
                                )
                              ],
                            )
                          ],
                        ),
                      )),
                  Step(
                      isActive: controller.currentStep.value >= 3,
                      state: controller.currentStep.value > 3
                          ? StepState.complete
                          : StepState.indexed,
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Price *',
                            style: TextStyle(
                                fontFamily: alata, fontSize: Get.width * 0.05),
                          ),
                        ],
                      ),
                      content: Form(
                        key: controller.priceFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Expected rent per month',
                                style: AppStyle.listPropSubHeading),
                            commonSpace1(),
                            CustomTextFormField(
                              hintText: 'Expected Month Rent',
                              inputType: TextInputType.number,
                              maxLength: 5,
                              onchanged: (value) =>
                                  controller.getRentVal(value),
                              validator: (value) =>
                                  isValid(value, 'Monthly Rent required'),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Note : Expected Rent should include any Maintenence Charges(or commission charges) that the tenant should pay.',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                            commonSpace(),
                            DataTable(
                              border: TableBorder.all(width: .5),
                              // headingRowColor: MaterialStateProperty.all(Colors.amber),
                              columnSpacing: 6,
                              horizontalMargin: 8,
                              columns: [
                                DataColumn(
                                    label: Text('Rent of house',
                                        style: AppStyle.priceTableStyle)),
                                DataColumn(
                                    label: SizedBox(
                                        width: 75,
                                        child: Text(
                                            '\u{20B9} ${controller.houseRent.value}',
                                            textAlign: TextAlign.center,
                                            style: AppStyle.priceTableStyle))),
                              ],
                              rows: [
                                DataRow(cells: [
                                  DataCell(Text('Ask4rent commission',
                                      style: AppStyle.priceTableStyle)),
                                  DataCell(SizedBox(
                                      width: 75,
                                      child: Text('5%',
                                          textAlign: TextAlign.center,
                                          style: AppStyle.priceTableStyle)))
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Commission amount',
                                      style: AppStyle.priceTableStyle)),
                                  DataCell(SizedBox(
                                      width: 75,
                                      child: Text(
                                          '\u{20B9} ${controller.commissionAmt.value}',
                                          textAlign: TextAlign.center,
                                          style: AppStyle.priceTableStyle)))
                                ]),
                                DataRow(cells: [
                                  DataCell(Text(
                                      'Rent you will receive per month',
                                      style: AppStyle.priceTableStyle)),
                                  DataCell(SizedBox(
                                      width: 75,
                                      child: Text(
                                          '\u{20B9} ${controller.receiveRent.value}',
                                          textAlign: TextAlign.center,
                                          style: AppStyle.priceTableStyle)))
                                ]),
                              ],
                            ),
                            commonSpace1(),
                            Row(
                              children: [
                                CustomOutlineButton(
                                  onPress: () {
                                    controller.currentStep.value -= 1;
                                  },
                                  title: 'Back',
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                CustomElevatedButton(
                                  title: 'Next',
                                  onPress: () {
                                    if (controller.priceFormKey.currentState!
                                        .validate()) {
                                      controller.currentStep.value < 4
                                          ? controller.currentStep.value += 1
                                          : null;
                                    }
                                  },
                                )
                              ],
                            )
                          ],
                        ),
                      )),
                  Step(
                      isActive: controller.currentStep.value >= 4,
                      state: controller.currentStep.value > 4
                          ? StepState.complete
                          : StepState.indexed,
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Photos *',
                            style: TextStyle(
                                fontFamily: alata, fontSize: Get.width * 0.05),
                          ),
                        ],
                      ),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Add Photos *',
                              style: AppStyle.listPropSubHeading),
                          commonSpace1(),
                          Container(
                            height: 130,
                            width: Get.width,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: .5, color: lightBlack),
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey.shade100),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.file_upload_outlined,
                                  color: primaryColor,
                                  size: Get.width * 0.1,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                CustomElevatedButton(
                                  title: 'Click here to Upload'.toUpperCase(),
                                  padding: 0,
                                  onPress: () {},
                                ),
                              ],
                            ),
                          ),
                          commonSpace(),
                        //  controller.uploadImages
                          Row(
                              children: [
                                CustomOutlineButton(
                                  onPress: () {
                                    controller.currentStep.value -= 1;
                                  },
                                  title: 'Back',
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                CustomElevatedButton(
                                  title: 'Submit',
                                 onPress: () {
                                   
                                 },
                                )
                              ],
                            )

                        ],
                      )),
                ]),
          )),
    );
  }
}
