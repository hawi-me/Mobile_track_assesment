import 'package:flutter/material.dart';

Widget searchBar() {
  return Container(
    width: 345,
    height: 56,
    decoration: BoxDecoration(
      color:
          Colors.grey[200], // Using a lighter shade of grey for better contrast
      borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
    ),
    child: TextField(
      decoration: InputDecoration(
        hintText: ('Search'),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.grey,
        ),
        suffixIcon: Icon(Icons.tune_outlined),
        border: InputBorder.none, // Removes the underline border
        contentPadding:
            EdgeInsets.all(16), // Adjusts padding inside the text field
      ),
    ),
  );
}
