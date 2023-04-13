import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PsicoAjuda"),
        backgroundColor: const Color(0xFF8A2BE2),
      ),
      body: ListView(
        children: const [
          Center(
            child: Text("teste"),
          ),
          TextField(
            decoration: InputDecoration(hintText: "teste"),
          )
        ],
      ),
    );
  }
}
