import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts

import 'package:tugas4_1/models/category.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
    required this.currentCategory,
  }) : super(key: key);

  final String currentCategory;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          categories.length,
          (index) => Container(
            margin: EdgeInsets.only(right: 20),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
              color: currentCategory == categories[index]
                  ? Colors.blue
                  : Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Row(
                children: [
                  Icon(Icons.fastfood),
                  SizedBox(width: 5),
                  Text(
                    categories[index],
                    style: GoogleFonts.poppins(
                      // Gunakan GoogleFonts untuk style teks
                      color: currentCategory == categories[index]
                          ? Colors.white
                          : Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
