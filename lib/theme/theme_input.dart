import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/tools/extension.dart';

class ThemeInput extends StatelessWidget {
  String? theLabelText;
  String theHintText;
  TextEditingController theTextEditingController;
  Function theValidation;
  Widget? theIconWidget;
  double theContentPadding;
  FloatingLabelBehavior? theFloatingLabelBehaviour;
  double? theInputHeight;
  ThemeInput(
      {Key? key,
      this.theLabelText,
      required this.theHintText,
      required this.theTextEditingController,
      required this.theValidation,
      this.theIconWidget,
      required this.theContentPadding,
      this.theFloatingLabelBehaviour,
      this.theInputHeight})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: theInputHeight ?? 8.0.hp,
      child:TextFormField(
      controller: theTextEditingController,
      validator: (value) {
        var result = theValidation(value);
        return result;
      },
      decoration: InputDecoration(
        labelText: theLabelText ?? '',
        hintText: theHintText,
        fillColor: white,
        errorStyle: TextStyle(height: 0.1),
        hintStyle: TextStyle(
          fontSize: 10.0.sp
        ),
        labelStyle: TextStyle(fontSize: 10.0.sp),
       floatingLabelBehavior: theFloatingLabelBehaviour ??  FloatingLabelBehavior.auto ,
        contentPadding: EdgeInsets.all(theContentPadding),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        suffixIcon: theIconWidget,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    ),);
  }
}
