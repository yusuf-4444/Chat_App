import 'package:chat_app/contants.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/widgets/custom_chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatView extends StatelessWidget {
  ChatView({super.key});
  CollectionReference messages = FirebaseFirestore.instance.collection(
    'messages',
  );

  TextEditingController controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  static String id = "ChatPage";

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;

    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy("createdAt", descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<MessageModel> messagesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(MessageModel.fromJson(snapshot.data!.docs[i]));
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/scholar.png", height: 50),
                  Text("Chat", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),

            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: _scrollController,
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) {
                      return CustomChatWidget(
                        messageModel: messagesList[index],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: controller,
                    onSubmitted: (data) {
                      data.trim();
                      if (data.isEmpty) {
                        return null;
                      }
                      messages.add({
                        "message": data,
                        "createdAt": DateTime.now(),
                        "email": email,
                      });
                      _scrollController.animateTo(
                        0,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                      controller.clear();
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: kPrimaryColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: kPrimaryColor),
                      ),
                      hintText: "Type a message",
                      filled: true,
                      fillColor: Colors.grey[200],
                      suffixIcon: Icon(Icons.send),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Scaffold(body: Center(child: Text("Loading...")));
        }
      },
    );
  }
}
