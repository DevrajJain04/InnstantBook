import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:innstantbook/model/model.dart';
import 'package:innstantbook/utilities/searchAPI.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final WorldwideHotelsApi _worldwideHotelsApi =
      WorldwideHotelsApi(); // Import your API service

  late HotelData _searchResults = HotelData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Hotels'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Enter location or hotel name',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    _performSearch();
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: _buildSearchResults(),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults() {
    HotelData hotel = _searchResults;
    return ListTile(
      leading: Image(image: CachedNetworkImageProvider(hotel.results?.data?[0].photo?.images?.thumbnail?.url ?? "")),
      title: Text(hotel.results?.data?[0].name ?? ""),
      
      // Add any other hotel information you want to display
    );
  }

  void _performSearch() async {
    String searchText = _searchController.text.trim();
    if (searchText.isNotEmpty) {
      // Use your Worldwide Hotels API service to search hotels
      await _worldwideHotelsApi.searchHotels(searchText).then((results) {
        setState(() {
          _searchResults = results;
        });
      });
    }
  }
}
