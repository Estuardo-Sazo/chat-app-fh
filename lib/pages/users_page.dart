import 'package:chat_app/models/user.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UsersPage extends StatefulWidget {
  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
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
    final autuSerive = Provider.of<AuthService>(context);
    final socketService = Provider.of<SocketService>(context);
    final user = autuSerive.user;
    return Scaffold(
        appBar: AppBar(
          title:  Text(
            user!.name,
            style: const TextStyle(color: Colors.black87),
          ),
          elevation: 1,
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: const Icon(Icons.exit_to_app, color: Colors.black87),
              onPressed: ()  {
                socketService.disconnect();
                Navigator.pushReplacementNamed(context, 'login');
                AuthService.deleteToken();

              }),
          actions: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 10),
              //child: const Icon(Icons.check_circle, color: Colors.blue),
              child: const Icon(Icons.offline_bolt, color: Colors.red),
            )
          ],
        ),
        body: SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          onRefresh: _loadUsers,
          header:  WaterDropHeader(
            complete: Icon(Icons.check, color: Colors.blue[400]),
            waterDropColor: Colors.blue[400] ?? Colors.blue,
          ),
          child: _listViewUsers(),
        ));
  }

  ListView _listViewUsers() {
    return ListView.separated(
      itemBuilder: (_, i) => _userListTitle(users[i]),
      separatorBuilder: (_, i) => const Divider(),
      itemCount: users.length,
    );
  }

  ListTile _userListTitle(User user) {
    return ListTile(
      title: Text(user.name),
      subtitle: Text(user.email),
      leading: CircleAvatar(
        backgroundColor: Colors.blue[100],
        child: Text(user.name.substring(0, 2)),
      ),
      trailing: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: user.online ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }

  _loadUsers() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }
}
