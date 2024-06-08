import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const _Logo(),

            _From(),

            _Labels(),

           const Text('Terms and conditions of use', style: TextStyle(fontWeight: FontWeight.w200)),
          ],
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 170,
        margin: const EdgeInsets.only(top: 50),
        child: const Column(
          children: <Widget>[
            Image(
              image: AssetImage('assets/tag-logo.png'),
            ),
            SizedBox(height: 100),
            Text('Messenger',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

class _From extends StatefulWidget {

  @override
  State<_From> createState() => __FromState();
}

class __FromState extends State<_From> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          const CustomInput(
            icon: Icons.mail_outline,
            placeholder: 'Email',
          ),
         const CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Password',
          ),
          BlueButton(
            text: 'Enter',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _Labels extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Text('Do not have an account?', style: TextStyle(color: Colors.black54, fontSize: 15)),
          SizedBox(height: 10),
          Text('Create one now!', style: TextStyle(color: Colors.blue[600], fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      );
    
  }
}

class CustomInput extends StatelessWidget {
  final IconData icon;
  final String placeholder;

  const CustomInput({super.key, required this.icon, required this.placeholder});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      margin: const EdgeInsets.only(bottom: 20),
      child: TextField(
        autocorrect: false,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          labelText: placeholder,
        ),
      ),
    );
  }
}

class BlueButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const BlueButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 2, 
        backgroundColor: Colors.blue,
        shape: const StadiumBorder(),
      ),
      child: Container(
        width: double.infinity,
        height: 55,
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
      ),
    );
  }
}