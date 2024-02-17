import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:innstantbook/model/model.dart';
import 'package:innstantbook/utilities/show_hotel.dart';

class Favourites extends StatefulWidget {
  const Favourites({super.key});

  @override
  FavouritesState createState() => FavouritesState();
}

class FavouritesState extends State<Favourites> {
  late Stream<QuerySnapshot<Object?>> stream; // Remove unused variable

  @override
  void initState() {
    super.initState();
    // Fetch data from Firestore when the widget is initialized
    fetchFavourites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firestore Data'),
      ),
      body: _buildBody(), // Call private method to build the body
    );
  }

  Future<void> fetchFavourites() async {
    // Get a reference to the desired collection
    final collectionRef = FirebaseFirestore.instance.collection('Favourites');

    // Fetch the data using a StreamBuilder
    setState(() {
      stream = collectionRef.snapshots();
    });
  }

  bool readLines = false;
  
  Widget _buildBody() {
    // Handle cases: no data, loading, error, or data available
    return StreamBuilder<QuerySnapshot<Object?>>(
      stream: stream, // Ensure stream is assigned in fetchData()
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            return ShowHotel(name: snapshot.data!.docs[index]['Title'], imagedetail: Images(), description: snapshot.data!.docs[index]['Text'], price: "");
          },
        );
      },
    );
  }
}
