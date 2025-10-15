// To parse this JSON data, do
//
//     final yesNoModel = yesNoModelFromJson(jsonString);
import 'package:yes_no_appp/domain/entities/message.dart';

class YesNoModel {
  final String answer;
  final bool forced;
  final String image;

  YesNoModel({required this.answer, required this.forced, required this.image});

  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
    answer: json["answer"],
    forced: json["forced"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "answer": answer,
    "forced": forced,
    "image": image,
  };

  //Retornar una instancia de Message
  Message toMessage() => Message(
    text: answer == 'yes' ? 'Si' : 'No',
    fromWho: FromWho.notMine,
    urlImage: image,
  );
}
