import 'package:cartizy_app/core/common/network/result_api.dart';
import 'package:cartizy_app/feature/home/data/repo/repo/home_repo_impl.dart';
import 'package:cartizy_app/feature/home/domain/entities/products_entity.dart';
import 'package:cartizy_app/feature/home/domain/repo/repository/home_repo.dart';

class GetProductUseCase {
  GetProductUseCase(this._homeRepo);
  final HomeRepo _homeRepo;

  Future<ResultApi<List<ProductsEntity>>> call() async =>
      _homeRepo.getProducts();
}
GetProductUseCase injectableGetProductUseCase() =>
    GetProductUseCase(injectableHomeRepo());