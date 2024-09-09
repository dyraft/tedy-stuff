import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery App',
      home: HomePage(),
      routes: {
        '/main': (context) => MainPage(),
        '/list': (context) => ListPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 250,
            color: Colors.green,
          ),
          SizedBox(height: 30),
          Text(
            'Complete your grocery need easily',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/main');
            },
            child: Text('Get Started'),
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Balance',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              '\$1,700.00',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Buy Orange 10 Kg\nGet discount 25%',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 30),
            Text(
              'For you',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CategoryItem(
                  label: 'Fruit',
                  imageUrl:
                      'https://cdn-icons-png.flaticon.com/512/2909/2909767.png',
                ),
                CategoryItem(
                  label: 'Vegetable',
                  imageUrl:
                      'https://cdn-icons-png.flaticon.com/512/7666/7666769.png',
                ),
                CategoryItem(
                  label: 'Cookies',
                  imageUrl:
                      'https://cdn-icons-png.flaticon.com/512/2769/2769233.png',
                ),
                CategoryItem(
                  label: 'Meat',
                  imageUrl:
                      'https://cdn-icons-png.flaticon.com/512/1046/1046784.png',
                ),
              ],
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/list');
              },
              child: Text('See Items List'),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListPage extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {'name': 'Orange', 'price': 15, 'stock': 1000},
    {'name': 'Apple', 'price': 20, 'stock': 1000},
    {'name': 'Banana', 'price': 5, 'stock': 1000},
    {'name': 'Mango', 'price': 15, 'stock': 1000},
    {'name': 'Orange', 'price': 10, 'stock': 1000},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Page'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            leading: Container(
              width: 50,
              height: 50,
              color: Colors.green,
            ),
            title: Text(item['name']),
            subtitle: Text('Stock: ${item['stock']}'),
            trailing: Text('\$${item['price']}'),
          );
        },
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String label;
  final String imageUrl;

  CategoryItem({required this.label, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          imageUrl,
          width: 60,
          height: 60,
        ),
        SizedBox(height: 10),
        Text(label),
      ],
    );
  }
}
