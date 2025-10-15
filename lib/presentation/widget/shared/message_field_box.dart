import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final FocusNode focusNode = FocusNode();

    final texControll =
        TextEditingController(); // Controlador para manejar el texto ingresado

    final outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40),
    );

    final inputDecoration = InputDecoration(
      hintText: 'Termina tu mensaje con un "?"',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final textValue = texControll
              .value
              .text; // Obtener el valor actual del TextEditingController
          onValue(textValue);
          texControll.clear(); // Limpiar el campo de texto después de enviar
        },
      ),
    );

    return TextFormField(
      focusNode: focusNode,
      onTapOutside: (event) {
        focusNode.unfocus(); // Quitar el foco cuando se toca fuera del campo
      },
      controller: texControll,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        onValue(value);
        texControll.clear(); // Limpiar el campo de texto después de enviar
        focusNode.requestFocus(); // Mantener el foco en el campo de texto
      },
    );
  }
}
