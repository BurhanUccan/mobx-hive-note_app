import 'package:flutter/material.dart';

class CustomAlertBox extends StatelessWidget {
  const CustomAlertBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("category title"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              icon: Icon(Icons.account_circle),
              labelText: '#example',
            ),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            "done",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    );
  }
}
