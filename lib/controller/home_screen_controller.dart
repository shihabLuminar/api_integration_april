import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreenController with ChangeNotifier {
  String? fact;
  bool isLoading = false;

  Future<void> getUserData() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.parse("https://catfact.ninja/fact"); // step 1 -  setup url
    var responseData = await http.get(url); //step 2 - get data from  url
    print(responseData.statusCode);
    print(responseData.body);
    if (responseData.statusCode == 200) {
      var decodedData = jsonDecode(responseData.body);
      print(decodedData["fact"]);
      fact = decodedData["fact"];
      isLoading = false;
    }

    notifyListeners();
  }
}
