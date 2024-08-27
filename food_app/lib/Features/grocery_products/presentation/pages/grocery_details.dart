import 'package:ecommerce_app/Features/grocery_products/domain/entites/grocery.dart';
import 'package:ecommerce_app/Features/grocery_products/presentation/pages/cart_page.dart';
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
  final String imageUrl;
  final String foodName;
  final double rating;
  final String oldPrice;
  final double newPrice;
  final String description;
  final List<Option> options1;

  const ProductDetailsPage({
    Key? key,
    required this.imageUrl,
    required this.foodName,
    required this.rating,
    required this.oldPrice,
    required this.newPrice,
    required this.description,
    required this.options1,
  }) : super(key: key);

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  bool _showOptions = false;
  Map<String, bool> _selectedOptions = {};
  int _quantity = 1; // Initial quantity

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  void _addToCart() {
    final cartItem = CartItem(
      imageUrl: widget.imageUrl,
      foodName: widget.foodName,
      price: widget.newPrice,
      quantity: _quantity,
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartPage(
          cartItems: [cartItem],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    for (var option in widget.options1) {
      _selectedOptions[option.name] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stack to overlay the back arrow and favorite icon on the image
            Stack(
              children: [
                // Product Image
                Container(
                  margin: EdgeInsets.all(8),
                  width: double.infinity,
                  height: 300,
                  child: Image.network(
                    widget.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                // Back Arrow
                Positioned(
                  top: 16,
                  left: 16,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                // Favorite Icon
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name
                  Text(
                    widget.foodName,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),

                  SizedBox(height: 16),
                  // Price
                  Row(
                    children: [
                      Text(
                        '\$${widget.oldPrice}',
                        style: TextStyle(
                          fontSize: 18,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        '\$${widget.newPrice}',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  // Rating
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      SizedBox(width: 4),
                      Text(
                        widget.rating.toString(),
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  // Description
                  Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    widget.description,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),

                  // "See More" button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _showOptions = !_showOptions;
                          });
                        },
                        child: Text(
                          _showOptions ? 'See Less' : 'See More',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),

                  // Additional Options
                  if (_showOptions && widget.options1.isNotEmpty) ...[
                    Text(
                      'Additional Options',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: widget.options1.map((option) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    option.name,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    '+\$${option.price}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Checkbox(
                                    value: _selectedOptions[option.name],
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _selectedOptions[option.name] = value!;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 16),
                  ],

                  // Add to Cart Button
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      width: 374,
                      height: 77,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(12), // Add border radius
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 6,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly, // Align items evenly
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            child: FloatingActionButton(
                                onPressed: _decrementQuantity,
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.black,
                                ),
                                backgroundColor: Colors.white,
                                shape: CircleBorder()),
                          ),
                          SizedBox(width: 16), // Space between buttons
                          Text(
                            '$_quantity',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(width: 16), // Space between buttons

                          Container(
                            width: 40,
                            height: 40,
                            child: FloatingActionButton(
                              onPressed: _incrementQuantity,
                              child: Icon(
                                Icons.add,
                                color: Colors.black,
                              ),
                              backgroundColor: Colors.white,
                              shape: CircleBorder(),
                            ),
                          ),
                          SizedBox(width: 16), // Space between buttons

                          ElevatedButton(
                            onPressed: _addToCart,
                            // Handle add to cart action

                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.orange,
                              minimumSize: Size(193, 53),
                              padding: EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.shopping_bag,
                                    size: 24), // Prefix icon
                                SizedBox(
                                    width: 8), // Space between icon and text
                                Text(
                                  'Add to Basket',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
