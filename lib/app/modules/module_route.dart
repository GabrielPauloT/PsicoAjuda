import 'package:flutter_modular/flutter_modular.dart';
import 'chat/presentation/chat.dart';
import 'home/presentation/home.dart';
import 'user/presentation/login/login_screen_page.dart';
import 'user/presentation/profile/profile_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePageScreen()),
  ];
}

class LoginModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => const LoginScreenPage()),
  ];
}

class ChatModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/:chatRoomId',
        child: (_, args) => ChatScreenPage(chatRoomId: args.params['chatRoomId'], selectUserName: args.data)),
  ];
}

class ProfileModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const ProfilePage()),
  ];
}
