import 'package:doodle_app/bloc/product/product_bloc.dart';
import 'package:doodle_app/bloc/product/product_event.dart';
import 'package:doodle_app/bloc/product/product_state.dart';
import 'package:doodle_app/presentation/cart_screen.dart';
import 'package:doodle_app/widgets/product_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProductListScreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  ProductListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text('Products'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search products',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onChanged: (value) {
                context.read<ProductBloc>().add(SearchProducts(value));
              },
            ),
          ),
        ),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProductLoaded) {
            return ProductListView(products: state.products, isCart: false);
          } else if (state is ProductError) {
            return Center(child: Text(state.message));
          } else {
            return Center(child: Text('Error'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartScreen()),
          );
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}