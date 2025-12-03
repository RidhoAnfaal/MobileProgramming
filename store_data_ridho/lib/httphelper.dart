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

  // NOTE: Pastikan authority ini masih valid! Mock API seringkali memiliki batas waktu.
  final String authority = '079my.wiremockapi.cloud';
  final String path = 'pizzalist';

  Future<List<Pizza>> getPizzaList() async {
    final Uri url = Uri.https(authority, path);

    try {
      final http.Response result = await http.get(url);

      if (result.statusCode == HttpStatus.ok) {
        final jsonResponse = json.decode(result.body);

        // Memastikan jsonResponse adalah List sebelum memanggil .map
        if (jsonResponse is List) {
          List<Pizza> pizzas = jsonResponse
              .map<Pizza>((i) => Pizza.fromJson(i))
              .toList();
          return pizzas;
        } else {
          // Jika respons bukan List (misalnya, objek error dari Mock API)
          print('Error parsing: JSON response is not a List.');
          return Future.error(
            'Data response is not a list. Received: ${jsonResponse.runtimeType}',
          );
        }
      } else {
        // Jika status code bukan 200 (misalnya 404, 500)
        print('HTTP Error: Status code ${result.statusCode}');
        return Future.error(
          'Failed to load pizzas. Status code: ${result.statusCode}',
        );
      }
    } on SocketException {
      // Menangani error koneksi jaringan (mis. tidak ada internet)
      print('Network Error: No internet connection.');
      return Future.error('No internet connection. Please check your network.');
    } catch (e) {
      // Menangani error parsing lainnya (mis. format JSON salah)
      print('General Error: $e');
      return Future.error('An unexpected error occurred: $e');
    }
  }
}
