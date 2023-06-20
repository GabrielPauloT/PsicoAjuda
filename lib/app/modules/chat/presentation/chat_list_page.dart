import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:psicoajuda/app/modules/chat/presentation/chat.dart';
import 'package:psicoajuda/app/modules/user/data/user_provider.dart';
import 'package:provider/provider.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({Key? key}) : super(key: key);

  @override
  _ChatListPageState createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  List<dynamic> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      Dio dio = Dio();
      Response response = await dio.get(
        'http://192.168.0.101:3001/user/',
      );

      if (response.statusCode == 200) {
        setState(() {
          users = response.data;
        });
      } else {
        print("Erro na requisição");
        debugPrint("Erro na requisição");
      }
    } catch (e) {
      print("Erro: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final userName = userProvider.loggedInUser;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Conversas'),
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
            ),
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('chatRooms')
            .where('users', arrayContains: userName)
            .orderBy('lastMessageTimestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final chatRooms = snapshot.data!.docs;
          final chatRoomsLeng = chatRooms.length;
          print(chatRoomsLeng);

          return ListView.builder(
            itemCount: chatRooms.length,
            itemBuilder: (context, index) {
              final chatRoom = chatRooms[index];
              final chatRoomId = chatRoom.id;

              // Buscar o usuário correspondente a este chat
              final user = users.firstWhere(
                (user) =>
                    user['email'] == chatRoom['users'][1] ||
                    user['email'] == chatRoom['users'][1],
                orElse: () => null,
              );

              if (user == null) {
                return const SizedBox(); // Usuário não encontrado, ignorar
              }

              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: InkWell(
                  onTap: () {
                    final selectUserName = user['name'];

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreenPage(
                          chatRoomId: chatRoomId,
                          selectUserName: selectUserName,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 4.0,
                          spreadRadius: 2.0,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const CircleAvatar(
                            backgroundImage: NetworkImage(
                            'https://s1.static.brasilescola.uol.com.br/be/2021/02/mico-leao-dourado.jpg', // URL de exemplo
                          ),
                          radius: 24.0,
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user['name'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4.0),
                              Text(
                                chatRoom['lastMessage'],
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        Text(
                          DateFormat('HH:mm').format(
                            chatRoom['lastMessageTimestamp'].toDate(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
