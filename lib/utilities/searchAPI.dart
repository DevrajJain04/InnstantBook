import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:innstantbook/model/model.dart';

class WorldwideHotelsApi {
  final String baseUrl = 'https://worldwide-hotels.p.rapidapi.com/';

  Future<HotelData> searchHotels(String query) async {
    final response = await http.post(
      Uri.parse('$baseUrl/search?query=$query'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data.map((json) => HotelData.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load hotels');
    }
  }
}