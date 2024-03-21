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
  bool? theLoadingStatus;
  var theFormKey;
  Color theColor;
  Color? theBorderColor;
  double? theWidth;
  double? theHeight;
  double? theVerticalPadding;
  double? theHorizontalPadding;
  double? theBorderRadius;
  Color? theShadowColor;
  ThemeButton(
      {Key? key,
      required this.theContent,
      this.theAction,
      this.theFormKey,
      this.theLoadingStatus,
      required this.theColor,
      this.theBorderColor,
       this.theHeight,
      this.theWidth,
      this.theVerticalPadding,
      this.theHorizontalPadding,
      this.theBorderRadius,
      this.theShadowColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return theLoadingStatus == false
        ? (ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
              backgroundColor: theColor,
              surfaceTintColor: theColor,
              shadowColor: theShadowColor,
              elevation: 5,
              foregroundColor: crem,
              fixedSize:Size(theWidth??40, theHeight?? 5),
              minimumSize: Size(theWidth??40, theHeight?? 5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(theBorderRadius ?? 4.0.sp), // Border radius
                side: BorderSide(color: theBorderColor ?? Colors.transparent), 
              ),
            ),
            onPressed: () {
              if (theFormKey == null) {
                theAction!();
              } else {
                if (theFormKey.currentState!.validate()) {
                  theAction!();
                }
              }
            },
            child: theContent))
        :  CircularProgressIndicator(color:crem);

    //   Center(
    // child: LoadingAnimationWidget.staggeredDotsWave(
    //   color: yellow,
    //   size: 30.0.sp,
    // ));
  }
}
