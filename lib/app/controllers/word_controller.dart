import 'package:whats_that_mean/app/models/full_word.dart';
import 'package:http/http.dart' as http;

import 'api_controller.dart';

class WordController extends APIController {

  Future<http.Response> getWord({String? query}) async {
    var response = await http.get(Uri.parse('$endPoint$query'), headers: jsonHeaders);
    switch (response.statusCode) {
      case 200:
        return response;

      default:
        throw APIException('Unknown response', response.body);
    }
  }

}
