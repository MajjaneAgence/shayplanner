import 'package:shayplanner/tools/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeButton extends StatelessWidget {
  String theText;
  Function theAction;
  bool theLoadingStatus;
  var theFormKey;
  ThemeButton(
      {Key? key,
      required this.theText,
      required this.theAction,
      required this.theFormKey,
      required this.theLoadingStatus})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return theLoadingStatus == false
        ? (ElevatedButton(
            onPressed: () {
              //   if (theFormKey.currentState!.validate()) {
              //   theAction();
              // }
              theAction();
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.blue), // Background color
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17.0), // Rounded corners
                ),
              ),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                EdgeInsets.symmetric(
                    vertical: 10.0.sp, horizontal: 15.0.sp), // Padding
              ),
            ),
            child: Text(
              theText,
              style: TextStyle(
                fontSize: 11.0.sp, // Text size
                color: Colors.white, // Text color
              ),
            ),
          ))
        : const CircularProgressIndicator();
  }
}
