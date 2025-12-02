import 'package:cartizy_app/core/common/network/result_api.dart';
import 'package:cartizy_app/feature/home/domain/entities/categories_entity.dart';
import 'package:cartizy_app/feature/home/domain/entities/products_entity.dart';

abstract class HomeRepo {
  Future<ResultApi<List<CategoriesEntity>>> getCategories();
  Future<ResultApi<List<ProductsEntity>>> getProducts();
}
