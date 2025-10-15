import 'package:dio/dio.dart';
import 'package:yes_no_appp/domain/entities/message.dart';
import 'package:yes_no_appp/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');
    final YesNoModel responseModel = YesNoModel.fromJsonMap(response.data);

    return responseModel.toMessage(); //Convertimos el YesNoModel a Message
  }
}
