import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../errors/exceptions.dart';


class SimulateApiClient {
  static Future<dynamic> get(path)async{
    if (kDebugMode) {
      print("========================== GET DATA ==========================");
      print("path => $path");
    }
    final String jsonString = await rootBundle.loadString(path);

    if (kDebugMode) {
      print("jsonString => $jsonString");
      print("========================== END GET DATA ==========================");
    }
    if(jsonString.trim().isNotEmpty){
      return jsonString;
    }else{
      throw ServerException("Data not found");
    }

  }
}