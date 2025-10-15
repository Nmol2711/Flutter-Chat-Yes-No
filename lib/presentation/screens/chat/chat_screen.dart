import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_appp/domain/entities/message.dart';
import 'package:yes_no_appp/presentation/providers/chat_provider.dart';
import 'package:yes_no_appp/presentation/widget/chat/her_message_buble.dart';
import 'package:yes_no_appp/presentation/widget/chat/my_message_bubble.dart';
import 'package:yes_no_appp/presentation/widget/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(6.0),
          child: CircleAvatar(
            backgroundImage: const NetworkImage(
              "https://files.idyllic.app/files/static/2940960?width=256&optimizer=image",
            ),
          ),
        ),
        title: const Text('Scarlett Johanson ❤️'),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      //El SafeArea evita que los elementos se pongan detras de la barra de notificaciones o de la barra de navegacion
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];
                  return (message.fromWho == FromWho.notMine)
                      ? HerMessageBubble(message: message)
                      : MyMessageBubble(message: message);
                },
              ),
            ),
            //Caja de Texto
            //MessageFieldBox(onValue: (value) => chatProvider.sendMessage(value) ),
            MessageFieldBox(onValue: chatProvider.sendMessage),
          ],
        ),
      ),
    );
  }
}
