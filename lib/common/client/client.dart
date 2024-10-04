import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_google_books/common/models/result.dart';

class Client {
  static Dio httpClient() {
    final baseOptions = BaseOptions(baseUrl: 'https://www.googleapis.com/books/v1');

    return Dio(baseOptions);
  }

  static String apiKey() => dotenv.env['API_KEY'] ?? '';

  static String _genericError = "Errore generico!";

  Future<Result?> searchByValue(String value) async {
    try {
      final jsonResult = await httpClient().get("/volumes", queryParameters: {
        'q': value,
        'apiKey': apiKey,
      });

      return Result.fromJson(jsonResult.data);
    } on DioException catch (e) {
      if (e.response == null) {
        throw Exception(_genericError);
      }
      switch (e.response?.statusCode) {
        case 404:
          throw Exception('Nessun risultato trovato');
        case 500:
          throw Exception('Errore del server');
        default:
          throw Exception(_genericError);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Result?> searchByCategory(String value) async {
    try {
      final jsonResult = await httpClient().get("/volumes", queryParameters: {
        'q': 'subject:$value',
        'apiKey': apiKey,
      });

      return Result.fromJson(jsonResult.data);
    } on DioException catch (e) {
      if (e.response == null) {
        throw Exception(_genericError);
      }
      switch (e.response?.statusCode) {
        case 404:
          throw Exception('Nessun risultato trovato');
        case 500:
          throw Exception('Errore del server');
        default:
          throw Exception(_genericError);
      }
    } catch (e) {
      rethrow;
    }
  }
}
