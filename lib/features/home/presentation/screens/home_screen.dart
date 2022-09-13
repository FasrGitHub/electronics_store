import 'package:electronics_store/features/home/presentation/bloc/products_bloc/products_bloc.dart';
import 'package:electronics_store/features/home/presentation/widgets/best_seller_widget.dart';
import 'package:electronics_store/features/home/presentation/widgets/categories_widget.dart';
import 'package:electronics_store/features/home/presentation/widgets/hot_sales_widget.dart';
import 'package:electronics_store/features/home/presentation/widgets/location_and_filter_widget.dart';
import 'package:electronics_store/features/home/presentation/widgets/search_product_widget.dart';
import 'package:electronics_store/features/home/presentation/widgets/tab_bar_widget.dart';
import 'package:electronics_store/features/home/presentation/widgets/title_best_seller_widget.dart';
import 'package:electronics_store/features/home/presentation/widgets/title_category_widget.dart';
import 'package:electronics_store/features/home/presentation/widgets/title_hot_sales_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget hotSalesWidget = Container();
    Widget bestSellerWidget = Container();

    return MaterialApp(
      title: 'Electronics Store',
      home: Scaffold(
        // Todo возможно реализовать BottomNavigationBar для того что бы сделать анимацию и заголовки но пока сделаю заглущку для экономии времени
        bottomNavigationBar: const TabBarWidget(),
        body: SafeArea(
          child: BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
            if (state is ProductsLoading) {
              hotSalesWidget = const Center(child: CircularProgressIndicator());
              bestSellerWidget =
                  const Center(child: CircularProgressIndicator());
            } else if (state is ProductsLoaded) {
              hotSalesWidget =
                  HotSalesWidget(bannerProduct: state.bannerProducts);
              bestSellerWidget = BestSellerWidget(products: state.products);
            } else if (state is ProductsError) {
              print('${state.message}');
              return Text(state.message);
            }
            return ListView(
              children: [
                const LocationAndFilterWidget(),
                const TitleCategoryWidget(),
                const CategoriesWidget(),
                const SearchProductWidget(),
                const TitleHotSalesWidget(),
                hotSalesWidget,
                const TitleBestSellerWidget(),
                bestSellerWidget,
              ],
            );
          }),
        ),
      ),
    );
  }
}
