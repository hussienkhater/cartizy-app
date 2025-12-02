import 'package:cartizy_app/core/common/network/result_api.dart';
import 'package:cartizy_app/feature/home/data/repo/data_source/home_data_source_impl.dart';
import 'package:cartizy_app/feature/home/domain/entities/categories_entity.dart';
import 'package:cartizy_app/feature/home/domain/entities/products_entity.dart';
import 'package:cartizy_app/feature/home/domain/repo/data_source/home_data_source.dart';
import 'package:cartizy_app/feature/home/domain/repo/repository/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  HomeRepoImpl(this._dataSource);
  final HomeDataSource _dataSource;
  @override
  Future<ResultApi<List<CategoriesEntity>>> getCategories() =>
      _dataSource.getCategories();
      
  @override
  Future<ResultApi<List<ProductsEntity>>> getProducts() =>
      _dataSource.getProducts();
}
HomeRepo injectableHomeRepo() => HomeRepoImpl(injectableHomeDataSource()); 