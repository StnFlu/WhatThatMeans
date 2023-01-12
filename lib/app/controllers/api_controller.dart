import 'dart:convert';
import 'dart:io';

class APIController {
  String endPoint = "https://wordsapiv1.p.rapidapi.com/words/";
  Map<String, String> jsonHeaders = {
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.contentTypeHeader: 'application/json',
    'X-RapidAPI-Key' : '956fec86fbmshc5bd25981dc0101p1a28e3jsn381fd2675c4b'
};
}

class APIException implements Exception {
  String cause;
  String body;
  late Map<String, dynamic> jsonBody;

  APIException(this.cause, this.body) {
    try {
      jsonBody = json.decode(body) as Map<String, dynamic>;
    } catch (e) {
      jsonBody = {};
    }
  }

  @override
  String toString() {
    return "APIException :: $cause (${jsonBody.isNotEmpty ? jsonBody : body})";
  }
}
