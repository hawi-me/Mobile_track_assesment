import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: CartPage(),
    ),
  );
}

class CartPage extends StatelessWidget {
  final List<CartItem> cartItems = [
    CartItem(
      imageUrl: 'assets/welcome.png',
      foodName: 'Chicken Burger',
      quantity: 2,
      price: 6.00,
    ),
    CartItem(
      imageUrl: 'assets/welcome.png',
      foodName: 'Veggie Burger',
      quantity: 1,
      price: 5.00,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double totalPrice = cartItems.fold(
      0.0,
      (previousValue, item) => previousValue + (item.price * item.quantity),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return CartItemWidget(
                    imageUrl: item.imageUrl,
                    foodName: item.foodName,
                    quantity: item.quantity,
                    price: item.price,
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Price:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${totalPrice.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18, color: Colors.red),
                ),
              ],
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle checkout action
                },
                child: Text('Checkout', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartItem {
  final String imageUrl;
  final String foodName;
  final int quantity;
  final double price;

  CartItem({
    required this.imageUrl,
    required this.foodName,
    required this.quantity,
    required this.price,
  });
}

class CartItemWidget extends StatelessWidget {
  final String imageUrl;
  final String foodName;
  final int quantity;
  final double price;

  const CartItemWidget({
    super.key,
    required this.imageUrl,
    required this.foodName,
    required this.quantity,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Image.asset(
          imageUrl,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
        title: Text(foodName),
        subtitle: Text('Price: \$${price.toStringAsFixed(2)}'),
        trailing: Text('Qty: $quantity'),
      ),
    );
  }
}
