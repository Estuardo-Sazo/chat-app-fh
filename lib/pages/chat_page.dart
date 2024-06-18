import 'package:chat_app/widgets/chat_message.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _textController = TextEditingController();
  final _focusNode = FocusNode();

  List<ChatMessage> _messages = [
    ChatMessage(uid: '123', text: 'Hola Mundo'),
    ChatMessage(uid: '2343', text: 'Hola Tierra'),
    ChatMessage(uid: '123', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit'),
    ChatMessage(uid: '2343', text: 'Hola Tierra'),
  ] ;
  bool _estaEscribiendo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Column(
            children: <Widget>[
              CircleAvatar(
                child: Text('Te', style: TextStyle(fontSize: 12)),
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
                  itemBuilder: (_, i) => _messages[i],
                  itemCount: _messages.length,
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
        ));
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
              onChanged: (String text) {
                //TODO Cuando hay un valor para enviar

                setState(() {
                  if (text.trim().length > 0) {
                    _estaEscribiendo = true;
                  } else {
                    _estaEscribiendo = false;
                  }
                });
              },
              decoration:
                  const InputDecoration.collapsed(hintText: 'Enviar mensaje'),
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
                onPressed: _estaEscribiendo
                    ? () => _handleSubmitted(_textController.text.trim())
                    : null,
              ),
            ),
          )
        ],
      )),
    );
  }

  _handleSubmitted(String text) {
    _textController.clear();
    _focusNode.requestFocus();

    final newMessage = ChatMessage(uid: '123', text: text);
    _messages.insert(0, newMessage);
    setState(() {
      _estaEscribiendo = false;
    });
  }
}
