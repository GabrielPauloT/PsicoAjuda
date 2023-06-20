import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:psicoajuda/app/modules/user/data/user_provider.dart';

class ChatScreenPage extends StatefulWidget {
  final String chatRoomId;
  final String selectUserName;

  const ChatScreenPage({Key? key, required this.chatRoomId, required this.selectUserName}) : super(key: key);

  @override
  ChatScreenPageState createState() => ChatScreenPageState();
}

class ChatScreenPageState extends State<ChatScreenPage> {
  TextEditingController messageController = TextEditingController();

  void sendMessage(String messageText, String ownerId) {
    FirebaseFirestore.instance
        .collection('chat_rooms')
        .doc(widget.chatRoomId)
        .collection('messages')
        .add({
      'message': messageText,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'ownerId': ownerId,
    });

    final chatRoomRef = FirebaseFirestore.instance.collection('chatRooms').doc(widget.chatRoomId);

    chatRoomRef.update({
      'lastMessage': messageText,
      'lastMessageTimestamp': FieldValue.serverTimestamp(),
    });

    messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final userName = userProvider.loggedInUser;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.selectUserName),
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
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('chat_rooms')
                  .doc(widget.chatRoomId)
                  .collection('messages')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return ListView.builder(
                  reverse: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final message = snapshot.data!.docs[index];

                    final isMe = message['ownerId'] == userName;

                    final textAlignment = isMe ? TextAlign.right : TextAlign.left;

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 4.0,
                      ),
                      child: Row(
                        mainAxisAlignment: isMe
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        children: [
                          Container(
                          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
                            padding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 16.0,
                            ),
                            decoration: BoxDecoration(
                              color: isMe
                                  ? const Color.fromRGBO(255, 185, 5, 1)
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Column(
                              crossAxisAlignment: isMe
                                  ? CrossAxisAlignment.end
                                  : CrossAxisAlignment.start,
                              children: [
                                Text(
                                  message['message'],
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                  ),
                                  textAlign: textAlignment,
                                  // overflow: TextOverflow.clip,
                                  // maxLines: null,
                                ),
                                const SizedBox(height: 4.0),
                                Text(
                                  DateFormat('HH:mm').format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                      message['timestamp'],
                                    ),
                                  ),
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.blue,
                                  ),
                                  textAlign: textAlignment,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: const InputDecoration(
                      hintText: 'Digite uma mensagem...',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    if (messageController.text.isNotEmpty) {
                      sendMessage(messageController.text, userName!);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
