enum FromWho { me, notMine }

class Message {
  final String text;
  final String? urlImage;
  final FromWho fromWho;
  final bool send;

  Message({
    required this.text,
    this.urlImage,
    required this.fromWho,
    this.send = true,
  });
}
