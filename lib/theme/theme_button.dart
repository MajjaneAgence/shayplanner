import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_grad_container.dart';
import 'package:shayplanner/theme/theme_text.dart';
import 'package:shayplanner/tools/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeButton extends StatelessWidget {
  Widget theContent;
  Function? theAction;
  bool theLoadingStatus;
  var theFormKey;
  ThemeButton(
      {Key? key,
      required this.theContent,
       this.theAction,
      this.theFormKey,
      required this.theLoadingStatus})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return theLoadingStatus == false
        ? (InkWell(
            onTap: () {
              if (theFormKey == null) {
                theAction!();
              } else {
                if (theFormKey.currentState!.validate()) {
                  theAction!();
                }
              }
            },
            child: theContent))
        : const CircularProgressIndicator();
  }
}
