import 'package:cartizy_app/feature/home/domain/entities/categories_entity.dart';

class ProductsEntity {
  int id;
  String title;
  String slug;
  int price;
  String description;
  CategoriesEntity category;
  List<String> images;

  ProductsEntity({
    this.id=0,
    this.title='',
    this.slug='',
    this.price=0,
    this.description='',
    this.category= const CategoriesEntity(),
    this.images = const [],
  });

}



