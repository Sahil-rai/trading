import 'package:flutter/material.dart';

class SettingsButton extends StatelessWidget {
  final VoidCallback onPressFunc;
  final String btnText;

  SettingsButton({this.btnText, this.onPressFunc});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: SizedBox(
        width: 300,
        height: 50,
        child: ElevatedButton(
          onPressed: onPressFunc,
          child: Text(btnText),
        ),
      ),
    );
  }
}
