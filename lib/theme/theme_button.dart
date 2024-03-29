import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_grad_container.dart';
import 'package:shayplanner/theme/theme_text.dart';
import 'package:shayplanner/tools/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// use this theme button only if the function of the action of your button doesn't require parameters line : action(param1,param2)
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
        
      //   Center(
      // child: LoadingAnimationWidget.staggeredDotsWave(
      //   color: yellow,
      //   size: 30.0.sp,
      // ));
  }
}
