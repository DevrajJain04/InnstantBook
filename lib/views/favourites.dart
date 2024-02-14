import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
  bool faved = false;
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
            return ListTile(
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    snapshot.data!.docs[index]['Title'],
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    snapshot.data!.docs[index]['Text'],
                    maxLines: readLines ? 12 : 5,
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      child: Text(readLines ? "Read Less" : "Read More"),
                      onTap: () {
                        setState(() {
                          readLines = !readLines;
                        });
                      },
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      FirebaseFirestore.instance.collection('Favourites').doc(snapshot.data!.docs[index]['Title']).delete();
                      setState(() {
                        faved = !faved;
                      });
                    },
                    icon: Icon(Icons.favorite,
                        color: faved ? Colors.red : Colors.white),
                    label: const Text(""),
                    style: const ButtonStyle(
                      elevation: MaterialStatePropertyAll(10),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
