import 'package:doodle_app/models/product_detail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  List<ProductDetail> allProducts = [];

  ProductBloc() : super(ProductLoading()) {
    on<FetchProducts>((event, emit) async {
      try {
        final response = await Dio().get('https://fakestoreapi.com/products');
        if (response.statusCode == 200) {
          allProducts = (response.data as List).map((e) => ProductDetail.fromJson(e)).toList();
          emit(ProductLoaded(allProducts));
        } else {
          emit(ProductError('Failed to load products details. Status Code: ${response.statusCode}'));
        }
      } catch (e) {
        emit(ProductError('Error occurred: ${e.toString()}'));
      }
    });
    on<SearchProducts>((event, emit) {
      final filteredProducts = allProducts
          .where((product) => product.title.toLowerCase().contains(event.query.toLowerCase()))
          .toList();
      emit(ProductLoaded(filteredProducts));
    });
  }
}
