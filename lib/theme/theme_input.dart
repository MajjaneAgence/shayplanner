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
  bool? theTextVisibilty;
  TextInputType? theKeyboardType;
  Widget? thePrefixWidget;
  bool? theReadOnly;
  int? theMaxLength;
  ThemeInput(
      {Key? key,
      this.theLabelText,
      required this.theHintText,
      required this.theTextEditingController,
      required this.theValidation,
      this.theIconWidget,
      required this.theContentPadding,
      this.theFloatingLabelBehaviour,
      this.theInputHeight,
      this.theTextVisibilty,
      this.theKeyboardType,
      this.thePrefixWidget,
      this.theReadOnly,
      this.theMaxLength})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: theInputHeight ?? 5.0.hp,
      child:TextFormField(
      controller: theTextEditingController,
      obscureText: theTextVisibilty ?? false,
      keyboardType: theKeyboardType?? TextInputType.text,
      readOnly: theReadOnly ?? false,
      maxLength: theMaxLength  ,
      validator: (value) {
        var result = theValidation(value);
        return result;
      },
      style: TextStyle(fontSize: 10.0.sp),
      decoration: InputDecoration(
        labelText: theLabelText ?? '',
        hintText: theHintText,
        counterText:  "",
        fillColor: theReadOnly==null ?white :verylightGrey,
        errorStyle: TextStyle(height: 0.1,
        fontSize: 8.0.sp),
        hintStyle: TextStyle(
          fontSize: 10.0.sp
        ),
        labelStyle: TextStyle(fontSize: 10.0.sp),
       floatingLabelBehavior: theFloatingLabelBehaviour ??  FloatingLabelBehavior.never ,
        contentPadding: EdgeInsets.all(theContentPadding),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        prefix: thePrefixWidget ,
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
