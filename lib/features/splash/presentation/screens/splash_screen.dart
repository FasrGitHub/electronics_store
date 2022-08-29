import 'package:electronics_store/common/app_colors.dart';
import 'package:electronics_store/core/platform/network_info.dart';
import 'package:electronics_store/features/home/presentation/screens/home_screen.dart';
import 'package:electronics_store/features/splash/data/datasources/products_remote_data_source.dart';
import 'package:electronics_store/features/splash/data/repositories/product_repository_impl.dart';
import 'package:electronics_store/features/splash/presentation/bloc/products_bloc/products_bloc.dart';
import 'package:electronics_store/features/splash/presentation/widgets/logo_company_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final productRepositoryImpl = ProductRepositoryImpl(
      productsRemote: ProductsRemoteDataSource(),
      networkInfo: NetworkInfoImpl(InternetConnectionChecker()));

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductsBloc(productRepositoryImpl: productRepositoryImpl)
            ..add(LoadProducts()),
      child: Material(
        color: AppColors.darkBlueBackground,
        child: Stack(
          children: [
            const Center(child: LogoCompanyWidget()),
            BlocBuilder<ProductsBloc, ProductsState>(builder: (context, state) {
              if (state is ProductsLoaded) {
                return Navigator(
                  pages: [
                    MaterialPage(child: HomeScreen(
                      productList: state.products,
                      bannerProductList: state.bannerProducts,)),
                  ],
                  onPopPage: (_, __) => false,
                );
              } else if (state is ProductsError) {
                print('${state.message}');
                return Text(state.message);
              }
              return Container();
            }),
          ],
        ),
      ),
    );
  }
}
