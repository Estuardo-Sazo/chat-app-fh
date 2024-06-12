import 'package:chat_app/models/user.dart';
import 'package:flutter/material.dart';

class UsersPage extends StatefulWidget {
  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final users = [
    User(
      uid: '1',
      name: 'Jime',
      email: 'test@gmail.com',
      online: true,
    ),
    User(
      uid: '2',
      name: 'Lupe',
      email: 'test2@gmail.com',
      online: false,
    ),
    User(
      uid: '3',
      name: 'Maria Perez',
      email: 'test3@gmail.com',
      online: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Mi Nombre',
            style: TextStyle(color: Colors.black87),
          ),
          elevation: 1,
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: const Icon(Icons.exit_to_app, color: Colors.black87),
              onPressed: () => {}),
          actions: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 10),
              //child: const Icon(Icons.check_circle, color: Colors.blue),
              child: const Icon(Icons.offline_bolt, color: Colors.red),
            )
          ],
        ),
        body: ListView.separated(
          itemBuilder: (_, i) => ListTile(
            title: Text(users[i].name),
            subtitle: Text('subtitle'),
            leading: CircleAvatar(
              backgroundColor: Colors.blue[100],
              child: Text(users[i].name.substring(0, 2)),
            ),
            trailing: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: users[i].online ? Colors.green : Colors.red,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          separatorBuilder: (_, i) => const Divider(),
          itemCount: users.length,
        ));
  }
}
