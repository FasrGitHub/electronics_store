import 'package:electronics_store/common/app_colors.dart';
import 'package:electronics_store/core/platform/network_info.dart';
import 'package:electronics_store/features/home/data/datasources/products_remote_data_source.dart';
import 'package:electronics_store/features/home/data/repositories/product_repository_impl.dart';
import 'package:electronics_store/features/home/presentation/bloc/products_bloc/products_bloc.dart';
import 'package:electronics_store/features/home/presentation/widgets/best_seller_widget.dart';
import 'package:electronics_store/features/home/presentation/widgets/category_widget.dart';
import 'package:electronics_store/features/home/presentation/widgets/hot_sales_widget.dart';
import 'package:electronics_store/features/home/presentation/widgets/location_and_filter_widget.dart';
import 'package:electronics_store/features/home/presentation/widgets/search_product_widget.dart';
import 'package:electronics_store/features/home/presentation/widgets/tab_bar_widget.dart';
import 'package:electronics_store/features/home/presentation/widgets/title_best_seller_widget.dart';
import 'package:electronics_store/features/home/presentation/widgets/title_category_widget.dart';
import 'package:electronics_store/features/home/presentation/widgets/title_hot_sales_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);

  final productRepositoryImpl = ProductRepositoryImpl(
      productsRemote: ProductsRemoteDataSource(),
      networkInfo: NetworkInfoImpl(InternetConnectionChecker()));

  @override
  Widget build(BuildContext context) {
    Widget hotSalesWidget = Container();
    Widget bestSellerWidget = Container();

    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductsBloc>(
          create: (context) =>
              ProductsBloc(productRepositoryImpl: productRepositoryImpl)
                ..add(LoadProducts()),
        ),
      ],
      child: MaterialApp(
        title: 'Electronics Store',
        home: Scaffold(
          // Todo возможно реализовать BottomNavigationBar для того что бы сделать анимацию и заголовки но пока сделаю заглущку для экономии времени
          bottomNavigationBar: TabBarWidget(),
          body: SafeArea(
            child: BlocBuilder<ProductsBloc, ProductsState>(
                builder: (context, state) {
              if (state is ProductsLoading) {
                hotSalesWidget =
                    const Center(child: const CircularProgressIndicator());
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
                  LocationAndFilterWidget(),
                  const TitleCategoryWidget(),
                  const CategoryWidget(),
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
      ),
    );
  }
}
