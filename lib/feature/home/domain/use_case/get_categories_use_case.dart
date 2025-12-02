import 'package:cartizy_app/core/common/network/result_api.dart';
import 'package:cartizy_app/feature/home/data/repo/repo/home_repo_impl.dart';
import 'package:cartizy_app/feature/home/domain/entities/categories_entity.dart';
import 'package:cartizy_app/feature/home/domain/repo/repository/home_repo.dart';

class GetCategoriesUseCase {
  final HomeRepo _homeRepo;

  GetCategoriesUseCase(this._homeRepo);

  Future<ResultApi<List<CategoriesEntity>>> call() async =>
      _homeRepo.getCategories();
}
GetCategoriesUseCase injectableGetCategoriesUseCase() =>
    GetCategoriesUseCase(injectableHomeRepo());