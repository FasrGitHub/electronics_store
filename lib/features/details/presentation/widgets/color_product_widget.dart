import 'package:color_parser/color_parser.dart';
import 'package:electronics_store/features/details/presentation/bloc/colors_product_bloc/colors_product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorProductWidget extends StatelessWidget {
  const ColorProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorsProductBloc, ColorsProductState>(
      builder: (context, state) {
        final colors = state.colors;
        return Padding(
          padding: const EdgeInsets.only(left: 27, top: 14),
          child: SizedBox(
            width: 100,
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: colors.length,
              itemBuilder: (context, index) {
                return colorProduct(
                    colors[index],
                    colors[index] == state.activeColorsProduct ,
                    context,
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget colorProduct(
    String color,
    bool active,
    BuildContext context,
  ) {
    final categoriesBloc = BlocProvider.of<ColorsProductBloc>(context);

    return Padding(
      padding: const EdgeInsets.only(right: 19,),
      child: GestureDetector(
        onTap: () {
          categoriesBloc.add(SetActiveEvent(color));
        },
        child: getColorWidget(active, color),
      ),
    );
  }

  Widget getColorWidget(
    bool active,
    String color,
  ) {
    Widget icon;

    if (active) {
      icon = const Icon(Icons.check, color: Colors.white,);
    } else {
      icon = Container();
    }

    return Container(
      width: 40.0,
      height: 40.0,
      decoration: BoxDecoration(
        color: ColorParser.hex(color).getColor(),
        shape: BoxShape.circle,
      ),
      child: icon,
    );
  }
}
