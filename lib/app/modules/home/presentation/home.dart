import 'package:flutter/material.dart';
import 'package:psicoajuda/app/modules/chat/presentation/chat_list_page.dart';
import 'package:psicoajuda/app/modules/home_page/presentation/home_page.dart';
import 'package:psicoajuda/app/modules/search/presentation/search_page.dart';

import '../../user/presentation/profile/profile_page.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int _indiceAtual = 0;

  final List<Widget> _telas = [
    const HomePage(),
    const SearchPage(),
    const ProfilePage(),
    const ChatListPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.grey[500]),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.grey[500]),
            label: 'Pesquisar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, color: Colors.grey[500]),
            label: 'Conta',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_sharp, color: Colors.grey[500]),
            label: 'Chat',
          ),
        ],
        selectedItemColor: Colors.amber[800],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }
}
