import 'package:flutter/material.dart';

class ThemeCheckBox extends StatelessWidget {

  const ThemeCheckBox({
    required this.theLabel,
    required this.theContentPadding,
    required this.theValue,
    required this.theAction,
    required this.activeColor,
    required this.theFontSize,
    this.theGap = 4.0,
    this.theBold = false,
  });

  final String theLabel;
  final EdgeInsets theContentPadding;
  final bool theValue;
  final Function theAction;
  final Color activeColor;
  final double theFontSize;
  final double theGap;
  final bool theBold;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => theAction(theValue),
      child: Padding(
        padding: theContentPadding ?? const EdgeInsets.all(0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
              value: theValue,
              activeColor: activeColor,
              visualDensity: VisualDensity.compact,
              onChanged: (val) => theAction(val),
            ),
            SizedBox(
              width: theGap,
            ), // you can control gap between checkbox and label with this field
            Flexible(
              child: Text(
                theLabel,
                style: TextStyle(
                  fontSize: theFontSize,
                  fontWeight: theBold ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}