import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  const Labels({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text('Do not have an account?',
            style: TextStyle(color: Colors.black54, fontSize: 15)),
        const SizedBox(height: 10),
        Text('Create one now!',
            style: TextStyle(
                color: Colors.blue[600],
                fontSize: 18,
                fontWeight: FontWeight.bold)),
      ],
    );
  }
}
