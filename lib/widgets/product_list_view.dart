import 'package:doodle_app/models/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hive_flutter/hive_flutter.dart';


class ProductListView extends StatelessWidget {
  final List<ProductDetail> products;
  final bool isCart;

  const ProductListView({super.key, required this.products, required this.isCart});

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 500),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: ProductTile(product: product, isCart: isCart, index: index),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProductTile extends StatelessWidget {
  final ProductDetail product;
  final bool isCart;
  final int index;

  const ProductTile({super.key, required this.product, required this.isCart, required this.index});

  @override
  Widget build(BuildContext context) {
    final cartBox = Hive.box<ProductDetail>('cart');
    return ListTile(
      leading: Image.network(product.image, width: 50, height: 50),
      title: Text(product.title),
      subtitle: Text('\$${product.price}'),
      trailing: IconButton(
        icon: Icon(isCart ? Icons.remove_circle : Icons.add_shopping_cart),
        onPressed: () {
          if (isCart) {
            cartBox.deleteAt(index);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Removed from cart'),duration: const Duration(milliseconds: 1000)));
          } else {
            cartBox.add(product);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Added to cart'),duration: const Duration(milliseconds: 1000)));
          }
        },
      ),
    );
  }
}
