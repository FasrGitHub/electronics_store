import 'package:electronics_store/core/platform/network_info.dart';
import 'package:electronics_store/features/home/data/datasources/products_remote_data_source.dart';
import 'package:electronics_store/features/home/data/repositories/product_repository_impl.dart';
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
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../domain/entities/category_entity.dart';
import '../bloc/categories_bloc/categories_bloc.dart';

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
        BlocProvider<CategoriesBloc>(
          create: (BuildContext context) => CategoriesBloc()
            ..add(const CategoriesUpdateEvent([
              CategoryEntity(id: 1, name: "Phone"),
              CategoryEntity(id: 2, name: "Computer"),
              CategoryEntity(id: 3, name: "Health"),
              CategoryEntity(id: 4, name: "Books")
            ])),
        ),
      ],
      child: MaterialApp(
        title: 'Electronics Store',
        home: Scaffold(
          // Todo возможно реализовать BottomNavigationBar для того что бы сделать анимацию и заголовки но пока сделаю заглущку для экономии времени
          bottomNavigationBar: const TabBarWidget(),
          body: SafeArea(
            child: BlocBuilder<ProductsBloc, ProductsState>(
                builder: (context, state) {
              if (state is ProductsLoading) {
                hotSalesWidget =
                    const Center(child: CircularProgressIndicator());
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
      ),
    );
  }
}
