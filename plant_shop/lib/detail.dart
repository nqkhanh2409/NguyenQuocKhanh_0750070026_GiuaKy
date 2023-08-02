import 'package:flutter/material.dart';

import 'home.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back, size: 30)),
                  const Icon(Icons.shopping_cart_rounded, size: 30),
                ],
              ),
            ),
            _productImage(),
            const SizedBox(height: 16),
            Expanded(
                child: Container(
              padding: const EdgeInsets.only(left: 18, top: 28),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: _productDescription(product),
            ))
          ],
        ),
      ),
    );
  }

  Widget _productImage() {
    return Stack(
      children: [
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius:
                      const BorderRadius.all(Radius.elliptical(300, 50))),
            ),
          ),
        ),
        Center(
          child: Image.asset('assets/images/${product.image}',
              height: 350, fit: BoxFit.cover),
        )
      ],
    );
  }
}

Widget _productDescription(Product product) {
  return ListView(
    physics: const BouncingScrollPhysics(),
    children: [
      const Row(
        children: [
          SizedBox(
            width: 48,
            child: Divider(thickness: 5, color: Colors.black),
          ),
          SizedBox(width: 8),
          Text('Best choice', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
      const SizedBox(height: 24),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(product.title,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                )),
            child: Text('\$${product.price}',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white)),
          ),
        ],
      ),
      const SizedBox(height: 32),
      const Text('About',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
      const SizedBox(height: 14),
      Padding(
        padding: const EdgeInsets.only(right: 14),
        child: Text(product.desc),
      ),
      const SizedBox(height: 14),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ElevatedButton(onPressed: () {}, child: const Icon(Icons.remove)),
              const SizedBox(width: 14),
              const Text('1',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              const SizedBox(width: 14),
              ElevatedButton(onPressed: () {}, child: const Icon(Icons.add)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)))
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 48),
                child: Text('Buy', style: TextStyle(fontSize: 18)),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 48),
    ],
  );
}
