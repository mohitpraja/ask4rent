import 'package:ask4rent/core/global/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialog {
  CustomDialog(
      {this.descText,
      this.btnOkOnPress,
      this.btnCancelOnPress,
      this.isDismissable});
  final String? descText;
  final VoidCallback? btnOkOnPress;
  final VoidCallback? btnCancelOnPress;
  final bool? isDismissable;
  Color successGreen = Colors.green;
  Color cancelRed = Colors.red;
  TextStyle titleStyle = TextStyle(
      fontSize: Get.width * 0.07,
      fontWeight: FontWeight.bold,
      color: Colors.black54,
      letterSpacing: 1,
      fontFamily: ubuntu);
  TextStyle descStyle = TextStyle(
      color: Colors.black54,
      fontSize: Get.width * 0.045,
      fontFamily: ubuntu,
      fontWeight: FontWeight.w500);

  success2() {
    Get.defaultDialog(
        title: '',
        titlePadding: EdgeInsets.zero,
        contentPadding: btnCancelOnPress == null && btnOkOnPress == null
            ? EdgeInsets.zero
            : null,
        barrierDismissible: isDismissable ?? true,
        titleStyle: const TextStyle(fontSize: 0),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                height: 120, child: Image.asset('assets/gifs/success2.gif')),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Success',
              style: titleStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            descText == null
                ? const SizedBox()
                : Text(
                    '$descText',
                    style: descStyle,
                  ),
          ],
        ),
        actions: [
          Row(
            children: [
              btnCancelOnPress == null
                  ? const Text('')
                  : Expanded(
                      child: MaterialButton(
                        onPressed: () {},
                        elevation: 0,
                        shape: const StadiumBorder(),
                        color: cancelRed,
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
              const SizedBox(
                width: 5,
              ),
              btnOkOnPress == null
                  ? const Text('')
                  : Expanded(
                      child: MaterialButton(
                        onPressed: btnOkOnPress,
                        elevation: 0,
                        shape: const StadiumBorder(),
                        color: successGreen,
                        child: const Text(
                          'OK',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
            ],
          ),
        ]);
  }

  success1() {
    Get.defaultDialog(
        title: '',
        titlePadding: EdgeInsets.zero,
        contentPadding: btnCancelOnPress == null && btnOkOnPress == null
            ? EdgeInsets.zero
            : null,
        barrierDismissible: isDismissable ?? true,
        titleStyle: const TextStyle(fontSize: 0),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                height: 150, child: Image.asset('assets/gifs/success.gif')),
            Text(
              'Success',
              style: titleStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            
            descText == null
                ? const SizedBox()
                : Text(
                    '$descText',
                    style: descStyle,
                  ),
          ],
        ),
        actions: [
          Row(
            children: [
              btnCancelOnPress == null
                  ? const Text('')
                  : Expanded(
                      child: MaterialButton(
                        onPressed: () {},
                        elevation: 0,
                        shape: const StadiumBorder(),
                        color: cancelRed,
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
              const SizedBox(
                width: 5,
              ),
              btnOkOnPress == null
                  ? const Text('')
                  : Expanded(
                      child: MaterialButton(
                        onPressed: btnOkOnPress,
                        elevation: 0,
                        shape: const StadiumBorder(),
                        color: successGreen,
                        child: const Text(
                          'OK',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
            ],
          ),
        ]);
  }

  success() {
    Get.defaultDialog(
        title: '',
        titlePadding: EdgeInsets.zero,
        contentPadding: btnCancelOnPress == null && btnOkOnPress == null
            ? EdgeInsets.zero
            : null,
        barrierDismissible: isDismissable ?? true,
        titleStyle: const TextStyle(fontSize: 0),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                height: 150, child: Image.asset('assets/gifs/success1.gif')),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Success',
              style: titleStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            descText == null
                ? const SizedBox()
                : Text(
                    '$descText',
                    style: descStyle,
                  ),
          ],
        ),
        actions: [
          Row(
            children: [
              btnCancelOnPress == null
                  ? const Text('')
                  : Expanded(
                      child: MaterialButton(
                        onPressed: () {},
                        elevation: 0,
                        shape: const StadiumBorder(),
                        color: cancelRed,
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
              const SizedBox(
                width: 5,
              ),
              btnOkOnPress == null
                  ? const Text('')
                  : Expanded(
                      child: MaterialButton(
                        onPressed: btnOkOnPress,
                        elevation: 0,
                        shape: const StadiumBorder(),
                        color: Colors.blue,
                        child: const Text(
                          'OK',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
            ],
          ),
        ]);
  }

  success3() {
    Get.defaultDialog(
        title: '',
        titlePadding: EdgeInsets.zero,
        contentPadding: btnCancelOnPress == null && btnOkOnPress == null
            ? EdgeInsets.zero
            : null,
        barrierDismissible: isDismissable ?? true,
        titleStyle: const TextStyle(fontSize: 0),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                height: 150,
                child: Image.asset(
                  'assets/gifs/success3.gif',
                  fit: BoxFit.cover,
                )),
            Text(
              'Success',
              style: titleStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            descText == null
                ? const SizedBox()
                : Text(
                    '$descText',
                    style: descStyle,
                  ),
          ],
        ),
        actions: [
          Row(
            children: [
              btnCancelOnPress == null
                  ? const Text('')
                  : Expanded(
                      child: MaterialButton(
                        onPressed: () {},
                        elevation: 0,
                        shape: const StadiumBorder(),
                        color: cancelRed,
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
              const SizedBox(
                width: 5,
              ),
              btnOkOnPress == null
                  ? const Text('')
                  : Expanded(
                      child: MaterialButton(
                        onPressed: btnOkOnPress,
                        elevation: 0,
                        shape: const StadiumBorder(),
                        color: successGreen,
                        child: const Text(
                          'OK',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
            ],
          ),
        ]);
  }

  info() {
    Get.defaultDialog(
        title: '',
        titlePadding: EdgeInsets.zero,
        contentPadding: btnCancelOnPress == null && btnOkOnPress == null
            ? EdgeInsets.zero
            : null,
        barrierDismissible: isDismissable ?? true,
        titleStyle: const TextStyle(fontSize: 0),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 10,
            ),
            SizedBox(height: 100, child: Image.asset('assets/gifs/info.gif')),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Info',
              style: titleStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            descText == null
                ? const SizedBox()
                : Text(
                    '$descText',
                    style: descStyle,
                  ),
          ],
        ),
        actions: [
          Row(
            children: [
              btnCancelOnPress == null
                  ? const Text('')
                  : Expanded(
                      child: MaterialButton(
                        onPressed: () {},
                        elevation: 0,
                        shape: const StadiumBorder(),
                        color: cancelRed,
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
              const SizedBox(
                width: 5,
              ),
              btnOkOnPress == null
                  ? const Text('')
                  : Expanded(
                      child: MaterialButton(
                        onPressed: btnOkOnPress,
                        elevation: 0,
                        shape: const StadiumBorder(),
                        color: Colors.blue,
                        child: const Text(
                          'OK',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
            ],
          ),
        ]);
  }

  info1() {
    Get.defaultDialog(
        title: '',
        titlePadding: EdgeInsets.zero,
        contentPadding: btnCancelOnPress == null && btnOkOnPress == null
            ? EdgeInsets.zero
            : null,
        barrierDismissible: isDismissable ?? true,
        titleStyle: const TextStyle(fontSize: 0),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 10,
            ),
            SizedBox(height: 100, child: Image.asset('assets/gifs/info1.gif')),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Info',
              style: titleStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            descText == null
                ? const SizedBox()
                : Text(
                    '$descText',
                    style: descStyle,
                  ),
          ],
        ),
        actions: [
          Row(
            children: [
              btnCancelOnPress == null
                  ? const Text('')
                  : Expanded(
                      child: MaterialButton(
                        onPressed: () {},
                        elevation: 0,
                        shape: const StadiumBorder(),
                        color: cancelRed,
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
              const SizedBox(
                width: 5,
              ),
              btnOkOnPress == null
                  ? const Text('')
                  : Expanded(
                      child: MaterialButton(
                        onPressed: btnOkOnPress,
                        elevation: 0,
                        shape: const StadiumBorder(),
                        color: Colors.blue,
                        child: const Text(
                          'OK',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
            ],
          ),
        ]);
  }

  error() {
    Get.defaultDialog(
        title: '',
        titlePadding: EdgeInsets.zero,
        contentPadding: btnCancelOnPress == null && btnOkOnPress == null
            ? EdgeInsets.zero
            : null,
        barrierDismissible: isDismissable ?? true,
        titleStyle: const TextStyle(fontSize: 0),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 10,
            ),
            SizedBox(height: 100, child: Image.asset('assets/gifs/error.gif')),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Error',
              style: titleStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            descText == null
                ? const SizedBox()
                : Text(
                    '$descText',
                    style: descStyle,
                  ),
          ],
        ),
        actions: [
          Row(
            children: [
              btnCancelOnPress == null
                  ? const Text('')
                  : Expanded(
                      child: MaterialButton(
                        onPressed: () {},
                        elevation: 0,
                        shape: const StadiumBorder(),
                        color: cancelRed,
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
              const SizedBox(
                width: 5,
              ),
              btnOkOnPress == null
                  ? const Text('')
                  : Expanded(
                      child: MaterialButton(
                        onPressed: btnOkOnPress,
                        elevation: 0,
                        shape: const StadiumBorder(),
                        color: successGreen,
                        child: const Text(
                          'OK',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
            ],
          ),
        ]);
  }

  error1() {
    Get.defaultDialog(
        title: '',
        titlePadding: EdgeInsets.zero,
        contentPadding: btnCancelOnPress == null && btnOkOnPress == null
            ? EdgeInsets.zero
            : null,
        barrierDismissible: isDismissable ?? true,
        titleStyle: const TextStyle(fontSize: 0),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 10,
            ),
            SizedBox(height: 100, child: Image.asset('assets/gifs/error1.gif')),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Error',
              style: titleStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            descText == null
                ? const SizedBox()
                : Text(
                    '$descText',
                    style: descStyle,
                  ),
          ],
        ),
        actions: [
          Row(
            children: [
              btnCancelOnPress == null
                  ? const Text('')
                  : Expanded(
                      child: MaterialButton(
                        onPressed: () {},
                        elevation: 0,
                        shape: const StadiumBorder(),
                        color: cancelRed,
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
              const SizedBox(
                width: 5,
              ),
              btnOkOnPress == null
                  ? const Text('')
                  : Expanded(
                      child: MaterialButton(
                        onPressed: btnOkOnPress,
                        elevation: 0,
                        shape: const StadiumBorder(),
                        color: successGreen,
                        child: const Text(
                          'OK',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
            ],
          ),
        ]);
  }

  error2() {
    Get.defaultDialog(
        title: '',
        titlePadding: EdgeInsets.zero,
        contentPadding: btnCancelOnPress == null && btnOkOnPress == null
            ? EdgeInsets.zero
            : null,
        barrierDismissible: isDismissable ?? true,
        titleStyle: const TextStyle(fontSize: 0),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 10,
            ),
            SizedBox(height: 100, child: Image.asset('assets/gifs/error2.gif')),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Error',
              style: titleStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            descText == null
                ? const SizedBox()
                : Text(
                    '$descText',
                    style: descStyle,
                  ),
          ],
        ),
        actions: [
          Row(
            children: [
              btnCancelOnPress == null
                  ? const Text('')
                  : Expanded(
                      child: MaterialButton(
                        onPressed: () {},
                        elevation: 0,
                        shape: const StadiumBorder(),
                        color: cancelRed,
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
              const SizedBox(
                width: 5,
              ),
              btnOkOnPress == null
                  ? const Text('')
                  : Expanded(
                      child: MaterialButton(
                        onPressed: btnOkOnPress,
                        elevation: 0,
                        shape: const StadiumBorder(),
                        color: successGreen,
                        child: const Text(
                          'OK',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
            ],
          ),
        ]);
  }

  warning() {
    Get.defaultDialog(
        title: '',
        titlePadding: EdgeInsets.zero,
        contentPadding: btnCancelOnPress == null && btnOkOnPress == null
            ? EdgeInsets.zero
            : null,
        barrierDismissible: isDismissable ?? true,
        titleStyle: const TextStyle(fontSize: 0),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                height: 100, child: Image.asset('assets/gifs/warning2.gif')),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Warning',
              style: titleStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            descText == null
                ? const SizedBox()
                : Text(
                    '$descText',
                    style: descStyle,
                  ),
          ],
        ),
        actions: [
          Row(
            children: [
              btnCancelOnPress == null
                  ? const Text('')
                  : Expanded(
                      child: MaterialButton(
                        onPressed: () {},
                        elevation: 0,
                        shape: const StadiumBorder(),
                        color: cancelRed,
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
              const SizedBox(
                width: 5,
              ),
              btnOkOnPress == null
                  ? const Text('')
                  : Expanded(
                      child: MaterialButton(
                        onPressed: btnOkOnPress,
                        elevation: 0,
                        shape: const StadiumBorder(),
                        color: successGreen,
                        child: const Text(
                          'OK',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
            ],
          ),
        ]);
  }

  warning1() {
    Get.defaultDialog(
        title: '',
        titlePadding: EdgeInsets.zero,
        contentPadding: btnCancelOnPress == null && btnOkOnPress == null
            ? EdgeInsets.zero
            : null,
        barrierDismissible: isDismissable ?? true,
        titleStyle: const TextStyle(fontSize: 0),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                height: 100, child: Image.asset('assets/gifs/warning1.gif')),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Warning',
              style: titleStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            descText == null
                ? const SizedBox()
                : Text(
                    '$descText',
                    style: descStyle,
                  ),
          ],
        ),
        actions: [
          Row(
            children: [
              btnCancelOnPress == null
                  ? const Text('')
                  : Expanded(
                      child: MaterialButton(
                        onPressed: () {},
                        elevation: 0,
                        shape: const StadiumBorder(),
                        color: cancelRed,
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
              const SizedBox(
                width: 5,
              ),
              btnOkOnPress == null
                  ? const Text('')
                  : Expanded(
                      child: MaterialButton(
                        onPressed: btnOkOnPress,
                        elevation: 0,
                        shape: const StadiumBorder(),
                        color: successGreen,
                        child: const Text(
                          'OK',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
            ],
          ),
        ]);
  }

  warning2() {
    Get.defaultDialog(
        title: '',
        titlePadding: EdgeInsets.zero,
        contentPadding: btnCancelOnPress == null && btnOkOnPress == null
            ? EdgeInsets.zero
            : null,
        barrierDismissible: isDismissable ?? true,
        titleStyle: const TextStyle(fontSize: 0),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                height: 100, child: Image.asset('assets/gifs/warning.gif')),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Warning',
              style: titleStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            descText == null
                ? const SizedBox()
                : Text(
                    '$descText',
                    style: descStyle,
                  ),
          ],
        ),
        actions: [
          Row(
            children: [
              btnCancelOnPress == null
                  ? const Text('')
                  : Expanded(
                      child: MaterialButton(
                        onPressed: () {},
                        elevation: 0,
                        shape: const StadiumBorder(),
                        color: cancelRed,
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
              const SizedBox(
                width: 5,
              ),
              btnOkOnPress == null
                  ? const Text('')
                  : Expanded(
                      child: MaterialButton(
                        onPressed: btnOkOnPress,
                        elevation: 0,
                        shape: const StadiumBorder(),
                        color: successGreen,
                        child: const Text(
                          'OK',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
            ],
          ),
        ]);
  }
}
