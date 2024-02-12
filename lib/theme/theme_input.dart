import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shayplanner/theme/theme_colors.dart';

class ThemeInput extends StatelessWidget {
  String? theLabelText;
  String theHintText;
  TextEditingController theTextEditingController;
  Function theValidation;
  Widget? theIconWidget;
  double theContentPadding;
  FloatingLabelBehavior? theFloatingLabelBehaviour;
  ThemeInput(
      {Key? key,
      this.theLabelText,
      required this.theHintText,
      required this.theTextEditingController,
      required this.theValidation,
      this.theIconWidget,
      required this.theContentPadding,
      this.theFloatingLabelBehaviour})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: theTextEditingController,
      validator: (value) {
        var result = theValidation(value);
        return result;
      },
      decoration: InputDecoration(
        labelText: theLabelText ?? '',
        hintText: theHintText,
       floatingLabelBehavior: theFloatingLabelBehaviour ??  FloatingLabelBehavior.auto ,
        contentPadding: EdgeInsets.all(theContentPadding),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        fillColor: white,
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
    );
  }
}
