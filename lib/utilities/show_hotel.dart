import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:innstantbook/model/model.dart';
import 'package:innstantbook/views/hotel_detail_view.dart';

class ShowHotel extends StatefulWidget {
  final String name;
  final Images? imagedetail;
  final String description;
  final String price;
  const ShowHotel({
    super.key,
    required this.name,
    required this.imagedetail,
    required this.description,
    required this.price,
  });

  @override
  State<ShowHotel> createState() => _ShowHotelState();
}

class _ShowHotelState extends State<ShowHotel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => HotelDesc(
                name: widget.name,
                image: widget.imagedetail?.large?.url ?? "",
                description: widget.description,
                price: widget.price,
              ),
            ),
          );
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: 300,
                child: Text(
                  "${widget.name}\n",
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Image(
                image: CachedNetworkImageProvider(
                    widget.imagedetail?.large?.url ?? ""),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
