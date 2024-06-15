import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,  
        title: Column(
          children: <Widget>[
            CircleAvatar(
              child:   Text('Te', style: TextStyle(fontSize: 12)),
              backgroundColor: Colors.blue[100],
              maxRadius: 14,
            ),
          const SizedBox(height: 3),
           const Text('Melis Flores',
                style: TextStyle(color: Colors.black87, fontSize: 12))
          ],
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (_, i) => const Text('Hola Mundo'),
                itemCount: 20,
                reverse: true,
              ),
            ),
            const Divider(height: 1),
            //TODO CAJA DE TEXTO
            Container(
              color: Colors.white,
              height: 50,
            )
          ],
        ),
      )
    );
  }
}
