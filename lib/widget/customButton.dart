import 'package:flutter/material.dart';

import 'package:flutter_with_google_sheet/constants.dart';

class CustomButton extends StatelessWidget {
  Icon icon;
  String text;
  Function onpressed;
  CustomButton(
      {super.key,
      required this.icon,
      required this.onpressed,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: icon,
      label: Text(text),
      onPressed: () => onpressed(),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(PRIMARYCOLOR),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: const BorderSide(color: Colors.black, width: 2),
          ),
        ),
      ),
    );
  }
}
