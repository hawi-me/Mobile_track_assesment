import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final List<CartItem> cartItems;

  CartPage({required this.cartItems});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void _removeItem(int index) {
    setState(() {
      widget.cartItems.removeAt(index);
    });
  }

  void _increaseQuantity(int index) {
    setState(() {
      widget.cartItems[index].quantity++;
    });
  }

  void _decreaseQuantity(int index) {
    if (widget.cartItems[index].quantity > 1) {
      setState(() {
        widget.cartItems[index].quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Basket'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Order Summary'),
              ElevatedButton(
                onPressed: () {},
                child: Text('Add Items'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.red,
                ),
              ),
            ],
          ),
          Expanded(
            child: widget.cartItems.isEmpty
                ? Center(child: Text('Your cart is empty'))
                : ListView.builder(
                    itemCount: widget.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = widget.cartItems[index];
                      return Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Card(
                            margin: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            child: ListTile(
                              contentPadding: EdgeInsets.all(16),
                              leading: Image.network(item.imageUrl,
                                  width: 50, height: 50, fit: BoxFit.cover),
                              title: Text(item.foodName),
                              subtitle:
                                  Text('\$${item.price} x ${item.quantity}'),
                              trailing: Text('\$${item.price * item.quantity}'),
                            ),
                          ),
                          Positioned(
                            top: -10,
                            right: -10,
                            child: Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.cancel, color: Colors.black),
                                  onPressed: () => _removeItem(index),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            width: -5,
                            height: -5,
                            child: Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.add, color: Colors.green),
                                  onPressed: () => _increaseQuantity(index),
                                ),
                                IconButton(
                                  icon: Icon(Icons.remove, color: Colors.red),
                                  onPressed: () => _decreaseQuantity(index),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class CartItem {
  final String imageUrl;
  final String foodName;
  final double price;
  int quantity;

  CartItem({
    required this.imageUrl,
    required this.foodName,
    required this.price,
    required this.quantity,
  });
}
