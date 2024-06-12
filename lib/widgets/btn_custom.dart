import 'package:flutter/material.dart';

class BtnCustom extends StatelessWidget {
  final String textBtn;
  final void Function() onPressed;
  const BtnCustom({
    super.key,
    required this.textBtn,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 2,
        shape: const StadiumBorder(),
        backgroundColor: Colors.blue,
      ),
      child: Container(
        width: double.infinity,
        height: 55,
        child:  Center(
          child: Text(
            textBtn,
            style: const TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
      ),
    );
  }
}
