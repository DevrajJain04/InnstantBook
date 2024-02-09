import 'package:flutter/material.dart';
import 'package:innstantbook/utilities/fetch_data.dart';
import 'package:innstantbook/utilities/show_hotel.dart';

import '../constants/routes.dart';

class HotelSearch extends StatefulWidget {
  const HotelSearch({super.key});

  @override
  State<HotelSearch> createState() => _HotelSearchState();
}

class _HotelSearchState extends State<HotelSearch> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Explore Luxurious Hotels And Inns"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onTap: () {
                  Navigator.pushNamed(context, searchpage);
                },
                decoration: InputDecoration(
                  label: const Text('Enter Your City Or Hotelname'),
                  border: OutlineInputBorder(
                      gapPadding: 5, borderRadius: BorderRadius.circular(8)),
                  suffixIcon: const Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      child: Icon(
                        Icons.location_pin,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(
                      child: Text(
                        'In Your City !!',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              child: Text(
                'Top Recommended Hotels ',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            FutureBuilder(
                future: fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return SizedBox(
                      height: 350,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data?.results?.data?.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: 300,
                            child: ShowHotel(
                              name: snapshot.data?.results?.data?[index].name ??
                                  "",
                              imagedetail: snapshot
                                  .data?.results?.data?[index].photo?.images,
                              description: snapshot.data?.results?.data?[index]
                                      .description ??
                                  "",
                              price:
                                  snapshot.data?.results?.data?[index].price ??
                                      "",
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                })
          ],
        ),
      ),
    );
  }
}
