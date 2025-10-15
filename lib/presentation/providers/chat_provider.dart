import 'dart:math';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:yes_no_appp/config/theme/helpers/get_yes_no_answer.dart';
import 'package:yes_no_appp/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();
  final RegExp patronBusqueda = RegExp(
    r'Foto|fotico|fótico',
    caseSensitive: false, // Hace que FOTO, FoTo o fótico sean válidos
  );
  final List<String> messagePhoto = ["😝", "😘", "🙈", "❤️", "😌"];
  List<Message> messageList = [];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    messageList.add(
      Message(
        text: text,
        fromWho: FromWho.me,
        send: await isConnected() == true ? true : false,
      ),
    );

    if (await isConnected()) {
      // Comprobar si hay conexion a internet
      if (patronBusqueda.hasMatch(text)) {
        herReply(true);
      } else if (text.endsWith('?')) {
        herReply();
      }
    }
    notifyListeners(); //Notifica a los widgets que estan escuchando este provider que hubo un cambio
    moveScrollToBottom();
  }

  Future<void> resendMessage(Message messageToResend) async {
    // Buscamos el mensaje en la lista y lo eliminamos.
    // Esto funciona porque cada 'Message' es una instancia única en la lista.
    if (messageList.remove(messageToResend)) {
      // Si se encontró y eliminó, volvemos a enviar el texto de ese mensaje.
      await sendMessage(messageToResend.text);
    }
    // El método sendMessage ya notifica a los listeners y mueve el scroll.
  }

  Future<void> herReply([bool image = false]) async {
    final Message herMessage;
    if (image) {
      await Future.delayed(const Duration(seconds: 2));
      herMessage = Message(
        text: messagePhoto[Random().nextInt(messagePhoto.length)],
        fromWho: FromWho.notMine,
        //Generar un número aleatorio entre 1 y 3.
        urlImage: "assets/image/photo${Random().nextInt(3) + 1}.jpg",
      );
    } else {
      herMessage = await getYesNoAnswer.getAnswer();
    }

    messageList.add(herMessage);
    notifyListeners(); //Notifica a los widgets que estan escuchando este provider que hubo un cambio
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    // Mover el scroll hacia el final de la lista
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  Future<bool> isConnected() async {
    return await InternetConnection().hasInternetAccess;
  }
}
