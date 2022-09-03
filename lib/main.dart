import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart';

import 'material/product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,
      title: 'ListJSON',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var products = [];
  void getProduct(BuildContext context) async {
    final file = await rootBundle.loadString('assets/products.json');
    final json = jsonDecode(file) as List<dynamic>;
    products = json
        .map((dynamic e) => Product.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    getProduct(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'ListJSON',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 8,
                    margin: const EdgeInsets.all(10),
                    child: SizedBox(
                      height: 80,
                      child: ListTile(
                        leading: Column(
                          children: [
                            Text(products[index].productName),
                          ],
                        ),
                        title: Text(products[index].price.toString()),
                        // subtitle: Text(products[index].materials.toString()),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
