import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  final _textController = TextEditingController();
  final _focusNode = FocusNode();
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
              child: _inputChat(),
            )
          ],
        ),
      )
    );
  }

  Widget _inputChat() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: SafeArea(
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                onChanged: (String text){
                  //TODO Cuando hay un valor para enviar


                  setState(() {
                    
                  });
                },
                decoration: const InputDecoration.collapsed(
                  hintText: 'Enviar mensaje'
                ),
                focusNode: _focusNode,
              ),
            ),
            //Boton de enviar
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              child: IconTheme(
                data: IconThemeData(color: Colors.blue[400]),
                child: IconButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  icon: const Icon(Icons.send),
                  onPressed: () {},
                ),
              ),
            )
          ],
        )
      ),
    );
  }

  _handleSubmitted(String text) {
    print(text);
    _textController.clear();
    _focusNode.requestFocus();
  }
}
