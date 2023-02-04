import 'dart:convert';
import 'package:currency/models/moecls_1.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as ht;

class helper_date {
  helper_date._();

  static final helper_date helperApi = helper_date._();

  bool isIos = false;
  Future<currencyappp?> getCurrency({
    String k1 = "INR",
    String k2 = "CAD",
    String am = "0",
  }) async {
    String Base_Current = "$k1";
    String currencies = "$k2";
    String amount = "$am";
    Map curre_apiid = {};

    String ApiLink =
        "https://api.exchangerate.host/convert?from=${Base_Current}&to=${currencies}&amount=$amount";

    ht.Response response = await ht.get(Uri.parse(ApiLink));

    if (response.statusCode == 200) {
      curre_apiid = json.decode(response.body);

      // print(curre_apiid["data"]["CAD"]["value"]);
      currencyappp k = currencyappp(ValueChanged: curre_apiid["result"]);
      print(k.value);

      return k;
    }
  }
}
