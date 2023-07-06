/*
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final title;
  final content;
  final VoidCallback callback;
  final actionText;

  CustomDialog(this.title, this.content, this.callback,
      [this.actionText = "Play again"]);
  //Example: CustomDialog("O Won", "Tap to play again!", resetGame));
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        ElevatedButton(
          onPressed: callback,
          child: Text(actionText),
        )
      ],
    );
  }
}
*/