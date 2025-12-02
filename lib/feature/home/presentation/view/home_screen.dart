import 'package:cartizy_app/core/common/widget/product_item_widget.dart';
import 'package:cartizy_app/feature/home/domain/entities/categories_entity.dart';
import 'package:cartizy_app/feature/home/domain/entities/products_entity.dart';
import 'package:cartizy_app/feature/home/domain/use_case/get_categories_use_case.dart';
import 'package:cartizy_app/feature/home/domain/use_case/get_product_use_case.dart';
import 'package:cartizy_app/feature/home/presentation/view_model/home_cubit.dart';
import 'package:cartizy_app/feature/home/presentation/widgets/tab_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = HomeCubit(
      injectableGetCategoriesUseCase(),
      injectableGetProductUseCase(),
    );
    cubit.getCategories();
    cubit.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => cubit,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Text.rich(
              TextSpan(
                text: 'Hi !,\n',
                style: TextStyle(
                  color: Color(0xff212121),
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
                children: [
                  TextSpan(
                    text: 'Let’s start your shopping',
                    style: TextStyle(
                      color: Color(0xff212121),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Categories",
              style: TextStyle(
                color: Color(0xff212121),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),

            //! getCategories
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeErrorState) {
                  return Text(state.message, style: TextStyle(fontSize: 30));
                }
                if (state is HomeSuccessState) {
                  return TabContainerWidget(categories: cubit.categoriesList);
                }
                return Skeletonizer(
                  enabled: true,
                  child: TabContainerWidget(categories: dummyCategory),
                );
              },
            ),

            SizedBox(height: 16),

            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeErrorState) {
                  return Text(state.message, style: TextStyle(fontSize: 30));
                }
                if (state is HomeSuccessState) {
                  return Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 163 / 290,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 30,
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) => ProductItemWidget(
                        product: cubit.filteredProducts[index],
                      ),

                      itemCount: cubit.filteredProducts.length,
                    ),
                  );
                }
                return Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 163 / 290,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 30,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) => Skeletonizer(
                      enabled: true,
                      child: ProductItemWidget(product: dummyProducts[index]),
                    ),
                    itemCount: dummyProducts.length,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

List<CategoriesEntity> get dummyCategory =>
    List.generate(10, (index) => CategoriesEntity(name: "dummy"));

List<ProductsEntity> get dummyProducts => List.generate(
  20,
  (index) => ProductsEntity(
    images: [imageTest, imageTest, imageTest],
    title: "dummy",
    price: index * 10,
  ),
);
