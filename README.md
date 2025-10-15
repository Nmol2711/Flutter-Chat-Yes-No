# Yes No App

Una sencilla aplicación de chat construida con Flutter que simula una conversación. La app responde a preguntas y a palabras clave específicas con respuestas automáticas, incluyendo imágenes y GIFs.

## Vistazo a la App

A continuación, se muestran algunas de las características principales de la aplicación en acción.

| Chat Principal | Respuesta con GIF | Respuesta con Imagen | Reenviar Mensaje |
| :---: | :---: | :---: | :---: |
| <img src="assets/readme/chat_principal.jpg" width="250"> | <img src="assets/readme/respuesta_gif.jpg" width="250"> | <img src="assets/readme/respuesta_imagen.jpg" width="250"> | <img src="assets/readme/reenviar_mensaje.jpg" width="250"> |
|_Pantalla principal de la conversación._|_Respuesta automática con un GIF al hacer una pregunta._|_Respuesta con una imagen local al usar una palabra clave._|_Opción para reenviar un mensaje que no se pudo enviar._|

## Características

- **Interfaz de Chat:** Una interfaz de usuario limpia y funcional para una conversación fluida.
- **Respuestas Automáticas a Preguntas:** Si envías un mensaje que termina con un signo de interrogación (`?`), la aplicación consultará la API de Yes No WTF para obtener una respuesta aleatoria de "sí" o "no" acompañada de un GIF animado.
- **Respuestas con Imágenes Locales:** Si tu mensaje contiene las palabras "foto", "fotico" o "fótico" (sin importar mayúsculas o minúsculas), recibirás una respuesta con una imagen de la galería local de la app y un emoji.
- **Detección de Conexión:** La aplicación verifica si tienes conexión a internet antes de intentar enviar un mensaje. Los mensajes que no se pueden enviar por falta de conexión se marcan visualmente.
- **Reenvío de Mensajes:** Permite reenviar mensajes que no se pudieron enviar previamente.
- **Scroll Automático:** El chat se desplaza automáticamente hacia el último mensaje para mantener la conversación visible.
- **Gestión de Estado con Provider:** Se utiliza el paquete `provider` para una gestión de estado eficiente y organizada.

## Tecnologías y Paquetes Utilizados

- **Flutter y Dart**
- **Provider:** para la gestión del estado de la aplicación.
- **`internet_connection_checker_plus`:** para detectar la conectividad a internet en tiempo real.
- **`http`:** (asumido dentro de `get_yes_no_answer`) para realizar las peticiones a la API externa.

## Cómo empezar

Este proyecto es un punto de partida para una aplicación Flutter.

Si es tu primer proyecto en Flutter, aquí tienes algunos recursos que te ayudarán a empezar:

- Lab: Escribe tu primera aplicación Flutter
- Cookbook: Ejemplos útiles de Flutter

Para obtener ayuda para empezar con el desarrollo de Flutter, consulta la
documentación en línea, que ofrece tutoriales,
ejemplos, orientación sobre el desarrollo móvil y una referencia completa de la API.

### Instalación y Ejecución

1.  Clona el repositorio:
    ```sh
    git clone https://github.com/TU_USUARIO/yes_no_app.git
    ```
2.  Instala las dependencias:
    ```sh
    flutter pub get
    ```
3.  Ejecuta la aplicación:
    ```sh
    flutter run
    ```
