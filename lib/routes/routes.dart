import 'package:flutter/widgets.dart';
import '../pages/pages.dart';


final Map<String, Widget Function(BuildContext)> appRoutes = {
  'users': ( _ ) => UsersPage(),
  'chat': ( _ ) => ChatPage(),
  'login': ( _ ) => LoginPage(),
  'register': ( _ ) => RegisterPage(),
  'loading': ( _ ) => LoadingPage(),
};
