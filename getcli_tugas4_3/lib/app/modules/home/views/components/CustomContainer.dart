import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextContainer extends StatelessWidget {
  final String text;

  const CustomTextContainer({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 11, bottom: 13),
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 16,
            // fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
