import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class BeefScreen extends StatefulWidget {
  final String category;

  BeefScreen({required this.category});

  @override
  _BeefScreenState createState() => _BeefScreenState();
}

class _BeefScreenState extends State<BeefScreen> {
  List? meals; // Hapus inisialisasi dengan List kosong

  @override
  void initState() {
    super.initState();
    fetchMeals('pasta');
  }

  Future<void> fetchMeals(String category) async {
    final response = await http.get(Uri.parse(
        'https://www.themealdb.com/api/json/v1/1/filter.php?c=$category'));

    if (response.statusCode == 200) {
      setState(() {
        meals = jsonDecode(response.body)['meals'];
      });
    } else {
      throw Exception('Failed to load meals');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.category}'),
      ),
      body: meals == null // Periksa apakah meals null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: meals!.length,
              itemBuilder: (BuildContext context, int index) {
                final meal = meals![index];
                return GestureDetector(
                  onTap: () {
                    // Handle meal item tap
                  },
                  child: Card(
                    elevation: 3,
                    margin: EdgeInsets.all(8),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            meal['strMealThumb'],
                            fit: BoxFit.cover,
                            height: 200,
                            width: double.infinity,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            color: Colors.black.withOpacity(0.5),
                            child: Text(
                              meal['strMeal'] ?? '',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
