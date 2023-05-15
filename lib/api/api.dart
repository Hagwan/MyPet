import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:pets/constants.dart';

class CallApi {
  getData(apiUrl, para) async {
    var url = Uri.https(domainUrl, apiUrl, para);

    try {
      var response = await http
          .get(
            url,
            headers: _setHeaders(),
          )
          .timeout(const Duration(seconds: 10));
      return response;
    } on TimeoutException catch (_) {
    } on SocketException catch (_) {
      // Other exception
    }
  }
}

_setHeaders() => {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
