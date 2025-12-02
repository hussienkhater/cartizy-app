import 'package:cartizy_app/core/common/network/result_api.dart';
import 'package:cartizy_app/feature/home/data/api/home_api.dart';
import 'package:cartizy_app/feature/home/data/model/categories_response_dto.dart';
import 'package:cartizy_app/feature/home/data/model/product_response_dto.dart';
import 'package:cartizy_app/feature/home/domain/entities/categories_entity.dart';
import 'package:cartizy_app/feature/home/domain/entities/products_entity.dart';
import 'package:cartizy_app/feature/home/domain/repo/data_source/home_data_source.dart';

class HomeDataSourceImpl implements HomeDataSource {
  HomeDataSourceImpl(this._api);
  final HomeApi _api;
  @override
  Future<ResultApi<List<CategoriesEntity>>> getCategories() async {
    final result = await _api.getCategories();
    switch (result) {
      case SuccessApi<List<CategoriesResponseDto>>():
        return SuccessApi<List<CategoriesEntity>>(
          result.data.map((e) => e.toEntity()).toList(),
        );
      case ErrorApi<List<CategoriesResponseDto>>():
        return ErrorApi<List<CategoriesEntity>>(result.messageError);
    }
  }

  @override
  Future<ResultApi<List<ProductsEntity>>> getProducts() async {
    final result = await _api.getProducts();
    switch (result) {
      case SuccessApi<List<ProductResponseDto>>():
        return SuccessApi<List<ProductsEntity>>(
          result.data.map((e) => e.toEntity()).toList(),
        );
      case ErrorApi<List<ProductResponseDto>>():
        return ErrorApi<List<ProductsEntity>>(result.messageError);
    }
  }
}

HomeDataSource injectableHomeDataSource() =>
    HomeDataSourceImpl(injectableHomeApi());
