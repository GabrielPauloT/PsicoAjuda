import 'package:flutter/material.dart';
import 'user.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> users = allUsers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        flexibleSpace: Container(
          padding: const EdgeInsets.all(15.0),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromRGBO(255, 185, 5, 1),
              Color.fromRGBO(255, 166, 1, 1),
            ],
          )),
        ),
      ),
    );
  }

  void searchUser(String query) {
    final user = allUsers.where((users) {
      final userName = users.name.toLowerCase();
      final input = query.toLowerCase();
      return userName.contains(input);
    }).toList();
    setState(() => users = user);
  }
}
