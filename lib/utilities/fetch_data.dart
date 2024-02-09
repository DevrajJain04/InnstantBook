import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:innstantbook/constants/hotel_list.dart';
import 'package:innstantbook/constants/keys.dart';
import 'package:innstantbook/model/model.dart';


  Future<HotelData> fetchData() async {
    const String apiKey = apikey3;
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
      final data = json.decode(response.body);
      // final List<dynamic> hotelData = data['results']['data'];
      hotel = HotelData.fromJson(data);
    } else {
      print('le error aa gya hehehehehe ${response.statusCode}');
    }
    return hotel;
  }

