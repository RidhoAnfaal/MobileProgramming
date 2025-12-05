// lib/httphelper.dart
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:store_data_ridho/model/pizza.dart';

class HttpHelper {
  static final HttpHelper _httpHelper = HttpHelper._internal();
  HttpHelper._internal();
  factory HttpHelper() {
    return _httpHelper;
  }

  final String authority = '079my.wiremockapi.cloud';
  final String path = 'pizzalist'; 

  Future<List<Pizza>> getPizzaList() async {
    final Uri url = Uri.https(authority, path);

    try {
      final http.Response result = await http.get(url);

      if (result.statusCode == HttpStatus.ok) {
        final jsonResponse = json.decode(result.body);

        if (jsonResponse is List) {
          List<Pizza> pizzas = jsonResponse
              .map<Pizza>((i) => Pizza.fromJson(i))
              .toList();
          return pizzas;
        } else {
          print('Error parsing: JSON response is not a List. Received: ${jsonResponse.runtimeType}');
          return Future.error('Data response is not a list.');
        }
      } else {
        print('HTTP Error: Status code ${result.statusCode}');
        return Future.error(
          'Failed to load pizzas. Status code: ${result.statusCode}',
        );
      }
    } on SocketException {
      print('Network Error: No internet connection.');
      return Future.error('No internet connection. Please check your network.');
    } catch (e) {
      print('General Error: $e');
      return Future.error('An unexpected error occurred: $e');
    }
  }

  Future<String> postPizza(Pizza pizza) async {
    const postPath = '/pizza'; 
    
    String post = json.encode(pizza.toJson()); 
    
    Uri url = Uri.https(authority, postPath);

    http.Response r = await http.post(
      url,
      body: post,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    
    if (r.statusCode == HttpStatus.ok || r.statusCode == HttpStatus.created) {
       return 'Success! Status: ${r.statusCode} | Response: ${r.body}';
    } else {
       return 'Failed! Status: ${r.statusCode} | Response: ${r.body}';
    }
  }
}