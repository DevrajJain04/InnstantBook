import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:innstantbook/constants/hotel_list.dart';

Future<void> fetchData() async {
  const String apiKey = 'e0ee927a1bmshb9db2be1345abcbp1bc0bajsn04a44f32e1fe';
  const String apiHost = 'worldwide-hotels.p.rapidapi.com';
  const String apiUrl =
      'https://worldwide-hotels.p.rapidapi.com/search?location_id=45963&language=English&currency=USD&offset=0';

  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {
      'X-RapidAPI-Key': apiKey,
      'X-RapidAPI-Host': apiHost,
    },
    body: {
      "location_id": "45963",
      "language": "English",
      "currency": "USD",
      "offset": "0"
    },
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    final List<dynamic> hotelData = data['results']['data'];
    hotels = hotelData.cast<Map<String, dynamic>>();
  } else {
    print('Failed to load data: ${response.statusCode}');
  }
}
