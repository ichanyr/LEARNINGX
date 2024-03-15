import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts

import 'package:tugas4_1/models/recipe.dart';
import 'package:tugas4_1/widgets/categories.dart';

class MyRecipe extends StatefulWidget {
  MyRecipe({Key? key}) : super(key: key);

  @override
  State<MyRecipe> createState() => _MyRecipeState();
}

class _MyRecipeState extends State<MyRecipe> {
  String currentCategory = 'All';

  final List<Recipe> recipes = [
    Recipe(name: 'Sayur Bayam', imageUrl: 'assets/images/bayam.jpg'),
    Recipe(name: 'Tempe Kemangi', imageUrl: 'assets/images/tempekemangi_1.jpg'),
    Recipe(name: 'Salad Buah', imageUrl: 'assets/images/saladbuah.jpg'),
    Recipe(name: 'Dawet Ayu', imageUrl: 'assets/images/dawet_1.jpg'),
    Recipe(name: 'Opor Ayam', imageUrl: 'assets/images/opor_1.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/food.png',
                    width: 100,
                    height: 50,
                  ),
                  Container(
                    color: Colors.grey[200],
                    width: 250,
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Search Recipe',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Categories(currentCategory: currentCategory),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Katalog Resep Makanan',
                    style: GoogleFonts.poppins(
                      // Gunakan GoogleFonts widget untuk menggunakan font Poppins
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.settings),
                ],
              ),
              SizedBox(height: 8),
              Expanded(
                child: SingleChildScrollView(
                  child: GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    childAspectRatio: 0.55,
                    children: [
                      for (int i = 0; i < recipes.length; i++)
                        Container(
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Image.asset(
                                    recipes[i].imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 10,
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      recipes[i].name,
                                      style: GoogleFonts.poppins(
                                        // Gunakan GoogleFonts untuk style teks
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.access_time),
                                        SizedBox(width: 5),
                                        Text(
                                          '${i + 50} minutes',
                                          style: GoogleFonts.poppins(
                                            // Gunakan GoogleFonts untuk style teks
                                            fontSize: 15,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(
                                        'View Recipe',
                                        style: GoogleFonts.poppins(
                                          // Gunakan GoogleFonts untuk style teks
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 10,
                                spreadRadius: 1,
                              ),
                            ],
                            color: Colors.grey[200],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add functionality
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
