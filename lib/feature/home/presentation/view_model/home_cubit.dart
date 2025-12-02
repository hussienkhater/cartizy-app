import 'dart:developer';

import 'package:cartizy_app/core/common/network/result_api.dart';
import 'package:cartizy_app/feature/home/domain/entities/categories_entity.dart';
import 'package:cartizy_app/feature/home/domain/entities/products_entity.dart';
import 'package:cartizy_app/feature/home/domain/use_case/get_categories_use_case.dart';
import 'package:cartizy_app/feature/home/domain/use_case/get_product_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._categoriesUseCase, this._productUseCase)
    : super(HomeInitialState());
  final GetCategoriesUseCase _categoriesUseCase;
  final GetProductUseCase _productUseCase;

  List<CategoriesEntity> categoriesList = [];
  List<ProductsEntity> productsList = [];
  List<ProductsEntity> filteredProducts = [];

  Future<void> getCategories() async {
    emit(HomeLoadingState());
    final result = await _categoriesUseCase.call();
    switch (result) {
      case SuccessApi<List<CategoriesEntity>>():
        categoriesList = result.data;
        emit(HomeSuccessState());
      case ErrorApi<List<CategoriesEntity>>():
        emit(HomeErrorState(result.messageError));
    }
  }

  Future<void> getProducts() async {
    emit(HomeLoadingState());
    final result = await _productUseCase.call();
    switch (result) {
      case SuccessApi<List<ProductsEntity>>():
        productsList = result.data;
        if (categoriesList.isNotEmpty) {
          filterProductsByCategory(categoriesList[0].id);
        }
        emit(HomeSuccessState());
      case ErrorApi<List<ProductsEntity>>():
        emit(HomeErrorState(result.messageError));
    }
  }

  void filterProductsByCategory(int categoryId) {
    filteredProducts = productsList
        .where((product) => product.category.id == categoryId)
        .toList();

    log('Filtered Products: $filteredProducts');
    emit(HomeSuccessState());
  }
}
