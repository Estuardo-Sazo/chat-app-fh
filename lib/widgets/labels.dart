import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String route;
  final String title1;
  final String title2;
  const Labels(
      {super.key,
      required this.route,
      required this.title1,
      required this.title2});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
         Text(title1,
            style: const TextStyle(color: Colors.black54, fontSize: 15)),
        const SizedBox(height: 10),
        GestureDetector(
          child: Text(title2,
              style: TextStyle(
                  color: Colors.blue[600],
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          onTap: () {
            Navigator.pushReplacementNamed(context, route);
          },
        ),
      ],
    );
  }
}
