import 'package:electronics_store/common/app_colors.dart';
import 'package:electronics_store/features/home/presentation/bloc/categories_bloc/categories_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/category_entity.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        final categories = state.categories;

        return SizedBox(
          height: 93,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return category(
                categories[index],
                categories[index].id == state.activeCategoryId,
                context,
              );
            },
          ),
        );
      },
    );
  }

  Widget category(
    CategoryEntity category,
    bool active,
    BuildContext context,
  ) {
    final categoriesBloc = BlocProvider.of<CategoriesBloc>(context);

    return Padding(
      padding: const EdgeInsets.only(left: 27),
      child: GestureDetector(
        onTap: () {
          categoriesBloc.add(SetActiveEvent(category.id));
        },
        child: getCategoryIcon(active, category),
      ),
    );
  }

  Widget getCategoryIcon(
    bool active,
    CategoryEntity category,
  ) {
    Color circleColor;
    Color textColor;

    if (active) {
      circleColor = AppColors.orange;
      textColor = AppColors.orange;
    } else {
      circleColor = Colors.white;
      textColor = Colors.black;
    }
    return Column(
      children: [
        Container(
          width: 71.0,
          height: 71.0,
          decoration: BoxDecoration(
            color: circleColor,
            shape: BoxShape.circle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 7),
          child: Text(
            category.name,
            style: TextStyle(
                color: textColor, fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
