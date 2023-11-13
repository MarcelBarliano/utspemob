import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marketplace',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Marketplace'),
      ),
      body: _getBody(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return ProductList();
    // Add other cases for different tabs

      default:
        return Container(); // Default case, return an empty container
    }
  }
}

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace this with your logic to fetch and display products
    List<Product> products = [
      Product(name: 'Rice', price: 10.0),
      Product(name: 'Vegetables', price: 5.0),
      Product(name: 'Fruits', price: 7.0),
      Product(name: 'Meat', price: 9.0),
      Product(name: 'chicken', price: 8.0),
    ];

    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(products[index].name),
          subtitle: Text('\$${products[index].price.toStringAsFixed(2)}'),
          onTap: () {
            // Add navigation or product details screen
            // You can navigate to a new page or show a dialog
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(products[index].name),
                  content: Text('Price: \$${products[index].price.toStringAsFixed(2)}'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Close'),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}

class Product {
  final String name;
  final double price;

  Product({required this.name, required this.price});
}
