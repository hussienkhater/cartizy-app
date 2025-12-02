import 'package:cartizy_app/feature/home/domain/entities/categories_entity.dart';
import 'package:cartizy_app/feature/home/presentation/view_model/home_cubit.dart';
import 'package:cartizy_app/feature/home/presentation/widgets/tab_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabContainerWidget extends StatefulWidget {
  const TabContainerWidget({super.key, required this.categories});
  final List<CategoriesEntity> categories;

  @override
  State<TabContainerWidget> createState() => _TabContainerWidgetState();
}

class _TabContainerWidgetState extends State<TabContainerWidget> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();

    return DefaultTabController(
      initialIndex: 0,
      length: widget.categories.length,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          TabBar(
            isScrollable: true,
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            tabAlignment: TabAlignment.start,
            labelPadding: EdgeInsets.zero,
            onTap: (index) {
              final categoryId = widget.categories[index].id;
              cubit.filterProductsByCategory(categoryId);
            },
            tabs: widget.categories
                .map((source) => TabItemWidget(category: source))
                .toList(),
          ),
        ],
      ),
    );
  }
}
