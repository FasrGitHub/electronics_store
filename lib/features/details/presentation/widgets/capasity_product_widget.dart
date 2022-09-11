import 'package:electronics_store/common/app_colors.dart';
import 'package:electronics_store/features/details/presentation/bloc/capacity_product_bloc/capacity_product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CapacityProductWidget extends StatelessWidget {
  const CapacityProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CapacityProductBloc, CapacityProductState>(
      builder: (context, state) {
        final capacityProducts = state.capacityProducts;
        return Padding(
          padding: const EdgeInsets.only(left: 27, top: 14),
          child: SizedBox(
            width: 200,
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: capacityProducts.length,
              itemBuilder: (context, index) {
                return capacityProduct(
                  capacityProducts[index],
                  capacityProducts[index] == state.activeCapacityProduct,
                  context,
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget capacityProduct(
    String capacityProduct,
    bool active,
    BuildContext context,
  ) {
    final categoriesBloc = BlocProvider.of<CapacityProductBloc>(context);

    return Padding(
      padding: const EdgeInsets.only(
        right: 19,
      ),
      child: GestureDetector(
        onTap: () {
          categoriesBloc.add(SetActiveEvent(capacityProduct));
        },
        child: getIcon(active, capacityProduct),
      ),
    );
  }

  Widget getIcon(
    bool active,
    String capacityProduct,
  ) {
    Color colorWidget;
    Color colorText;
    String text;

    if (active) {
      colorWidget = AppColors.orange;
      colorText = Colors.white;
      text = '$capacityProduct GB';
    } else {
      colorWidget = Colors.transparent;
      colorText = Colors.grey;
      text = '$capacityProduct gb';
    }

    return Container(
      width: 72.0,
      height: 30.0,
      decoration: BoxDecoration(
        color: colorWidget,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: colorText,
            fontSize: 17,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
