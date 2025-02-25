import 'package:doodle_app/models/product_detail.dart';
import 'package:doodle_app/widgets/product_list_view.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';



class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Box<ProductDetail> cartBox = Hive.box<ProductDetail>('cart');
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: ValueListenableBuilder<Box<ProductDetail>>(
        valueListenable: cartBox.listenable(),
        builder: (context, box, _) {
          if (box.isEmpty) {
            return Center(child: Text('Cart is empty'));
          }
          double total = box.values.fold(0, (sum, product) => sum + product.price);
          return Column(
            children: [
              Expanded(child: ProductListView(products: box.values.toList(), isCart: true)),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Total: \$${total.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ],
          );
        },
      ),
    );
  }
}


