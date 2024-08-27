// import 'package:ecommerce_app/Features/grocery_products/presentation/widgets/grocery_items.dart';
// import 'package:ecommerce_app/Features/grocery_products/presentation/widgets/search_bar.dart';
// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.all(10),
//         child: Column(
//           children: [
//             AppBar(
//               title: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     'assets/Food Category.jpg',
//                     height: 24,
//                   ),
//                   SizedBox(width: 10),
//                   Text(
//                     'Burger',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 30,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Row(
//               children: [searchBar()],
//             ),
//             SizedBox(
//                 height: 10), // Add space between the AppBar and the content
//             Expanded(
//               child: GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2, // 2 cards per row
//                   crossAxisSpacing: 10.0,
//                   mainAxisSpacing: 10.0,
//                   childAspectRatio:
//                       0.75, // Adjust this value to control card height
//                 ),
//                 itemCount: 10, // The number of ProductCard widgets
//                 itemBuilder: (context, index) {
//                   return ProductCard(
//                     imageUrl: 'assets/burger.png',
//                     foodName: 'Chicken Burger',
//                     rating: 4.9,
//                     oldPrice: '10',
//                     newPrice: '6',
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/Features/grocery_products/presentation/bloc/grocery_bloc.dart';
import 'package:ecommerce_app/Features/grocery_products/presentation/widgets/grocery_items.dart';
import 'package:ecommerce_app/Features/grocery_products/presentation/widgets/search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Dispatch the event to fetch products when the widget is initialized
    context.read<GroceryBloc>().add(GetProductEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/Food Category.jpg',
                    height: 24,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Burger',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [searchBar()],
            ),
            SizedBox(height: 10),
            Expanded(
              child: BlocBuilder<GroceryBloc, GroceryState>(
                builder: (context, state) {
                  if (state is GroceryLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is GroceryLoaded) {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        final product = state.products[index];
                        return ProductCard(
                          imageUrl: product.imageUrl,
                          foodName: product.title,
                          rating: product.rating,
                          oldPrice: '10',
                          newPrice: product.price,
                          discription: product.description,  option1: product.options,
                          
                          
                        );
                      },
                    );
                  } else if (state is GroceryError) {
                    return Center(child: Text('Error: ${state.message}'));
                  }
                  return Container(); // Return an empty container if no state is matched
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
