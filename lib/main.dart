import 'package:flutter/material.dart';

import 'home.dart';
 // Ensure this import is correct

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: const Text('Checkout'),
          ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Banking Information',
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                  // border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'PIN',
                  // border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Card Name',
                  // border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Expired Date (MM/YY)',
                  // border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'CVV',
                  // border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.info_outline),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Personal Information',
                        // border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('edit'),
                  ),
                ],
              ),
              const Text('Trần Minh Trí'),
              const Text('tmtri310251@gmail.com'),
              const Text('60 Láng Hạ, Ba Đình, Hà Nội'),
              const Text('0123456789'),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Delivery Method',
                        // border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('edit'),
                  ),
                ],
              ),
              const Text('Quick Shipping - \$15'),
              const Text('Expected Shipping Date: May 5th'),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Hình thức thanh toán',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('chỉnh sửa'),
                  ),
                ],
              ),
              const Text('Thẻ VISA/MASTERCARD'),
              const SizedBox(height: 20),
              const Divider(),
              const Text(
                'Đơn hàng đã chọn',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PlantPage()),
                  );
                },
                child: Row(
                  children: [
                    Image.network(
                      'https://cdn.shopify.com/s/files/1/0260/3037/4957/products/small-plant-spider-plant-white-pot_300x300.jpg',
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Spider Plant'),
                          Text('250.000đ'),
                          Text('2 items'),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
