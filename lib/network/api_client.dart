

 import 'dart:convert';

import 'package:http/http.dart'as http;

import '../model/weather_response.dart';


 class ApiClient {
   ApiClient._();


   static final ApiClient instance = ApiClient._();

   Future<Weatherresponse> getWeather() async {
     var client = http.Client();
     try {
       var response = await client.get(
           Uri.https("api.openweathermap.org",
               "/data/2.5/weather",
               {
                 "q": "tashkent,uz",
                 "units": "metric",
                 "appid": "8118ed6ee68db2debfaaa5a44c832918"
               }
           )
       );
       var decodeResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
       return Weatherresponse.fromJson(decodeResponse);
     }
     finally {
       client.close();

     }
   }
 }