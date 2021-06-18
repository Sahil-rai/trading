import 'package:flutter/material.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    Key key,
    @required this.btnText,
  }) : super(key: key);

  final String btnText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: SizedBox(
        width: 300,
        height: 50,
        child: ElevatedButton(
          onPressed: () {},
          child: Text(btnText),
        ),
      ),
    );
  }
}
