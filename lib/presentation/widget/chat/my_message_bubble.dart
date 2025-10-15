import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_appp/domain/entities/message.dart';
import 'package:yes_no_appp/presentation/providers/chat_provider.dart';

class MyMessageBubble extends StatelessWidget {
  final Message message;

  const MyMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(
      context,
    ).colorScheme; //Accedemos al tema de la aplicacion
    final chatProvider = context.read<ChatProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: message.send == true
                  ? null
                  : () => chatProvider.resendMessage(message),
              icon: Icon(
                Icons.error_outline,
                color: message.send == true ? Colors.transparent : Colors.red,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: colorTheme.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Text(
                  message.text,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),
      ],
    );
  }
}
