import 'package:dio/dio.dart';
import 'package:flutter_maps/constants/strings.dart';

class PlacesWebServices {
  late Dio dio;

  PlacesWebServices() {
    BaseOptions options = BaseOptions(
      connectTimeout: const Duration(milliseconds: 20 * 1000),
      receiveTimeout: const Duration(milliseconds: 20 * 1000),
      receiveDataWhenStatusError: true,
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> fetchSuggestions(
      String place, String sessionToken) async {
    try {
      Response response = await dio.get(suggestionBaseURL, queryParameters: {
        'input': place,
        // 'type': 'address', // يمكنك إزالته إذا لم يكن ضروريًا
        'components': 'country:qa',
        'sessiontoken': sessionToken,
        'key': googleMapApiKey,
      });

      if (response.statusCode == 200) {
        print(response.data['predictions']);
        return response.data['predictions'];
      } else {
        print('Error: ${response.statusCode}');
        return [];
      }
    } catch (error) {
      print('Fetch suggestions error: ${error.toString()}');
      return [];
    }
  }
}
