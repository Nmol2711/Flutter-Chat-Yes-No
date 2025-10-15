import 'package:flutter/material.dart';
import 'package:yes_no_appp/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;
  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(
      context,
    ).colorScheme; //Accedemos al tema de la aplicacion

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colorTheme.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 5),
        if (message.urlImage != null)
          _ImagenBubble(urlImage: message.urlImage!),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _ImagenBubble extends StatelessWidget {
  final String urlImage;
  const _ImagenBubble({required this.urlImage});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // Verificamos si la URL es de red o un asset local.
    final isNetworkImage = urlImage.startsWith('http');

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: isNetworkImage
          ? Image.network(
              urlImage,
              width: size.width * 0.7,
              height: 150,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  width: size.width * 0.7,
                  height: 150,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                );
              },
            )
          : Image.asset(
              urlImage,
              width: size.width * 0.7,
              height: 150,
              fit: BoxFit.cover,
            ),
    );
  }
}
