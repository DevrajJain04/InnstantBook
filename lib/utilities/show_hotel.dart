import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:innstantbook/constants/hotel_list.dart';
import 'package:innstantbook/utilities/fetch_data.dart';
import 'package:innstantbook/views/hotel_detail_view.dart';

class ShowHotel extends StatefulWidget {
  final int index;
  const ShowHotel({super.key, required this.index});

  @override
  State<ShowHotel> createState() => _ShowHotelState();
}

class _ShowHotelState extends State<ShowHotel> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => HotelDesc(
              name: hotels[widget.index]['name'],
              image: hotels[widget.index]['photo']['images']['large']['url'],
              description: hotels[widget.index]['description'],
            ),
          ),
        );
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "${hotels[widget.index]['name']}\n",
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
            ),
            Image(image: CachedNetworkImageProvider(hotels[widget.index]['photo']['images']['medium']['url'])),
          ],
        ),
      ),
    ));
  }
}
