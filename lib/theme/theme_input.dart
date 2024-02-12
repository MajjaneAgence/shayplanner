import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ThemeInput extends StatelessWidget {
  String theLabelText;
  String theHintText;
  TextEditingController theTextEditingController;
  Function theValidation;
  Widget? theIconWidget;
  double theContentPadding;
  ThemeInput(
      {Key? key,
      required this.theLabelText,
      required this.theHintText,
      required this.theTextEditingController,
      required this.theValidation,
      this.theIconWidget,
      required this.theContentPadding})
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
        labelText: theLabelText,
        hintText: theHintText,
        contentPadding: EdgeInsets.all(theContentPadding),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        fillColor: Colors.grey[200],
        filled: true,
        suffixIcon: theIconWidget,
      ),
    );
  }
}
