import 'package:electronics_store/core/platform/network_info.dart';
import 'package:electronics_store/features/details/data/datasource/product_details_remote_data_source.dart';
import 'package:electronics_store/features/details/data/repositories/product_details_repository_impl.dart';
import 'package:electronics_store/features/details/presentation/bloc/product_details_bloc/product_details_bloc.dart';
import 'package:electronics_store/features/details/presentation/widgets/navigation_widget.dart';
import 'package:electronics_store/features/details/presentation/widgets/product_details_info_widget.dart';
import 'package:electronics_store/features/details/presentation/widgets/product_image_carousel_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class DetailsProductScreen extends StatelessWidget {
  DetailsProductScreen({Key? key}) : super(key: key);

  final productDetailsRepositoryImpl = ProductDetailsRepositoryImpl(
    remoteDataSource: ProductDetailsRemoteDataSource(),
    networkInfo: NetworkInfoImpl(InternetConnectionChecker()),
  );

  @override
  Widget build(BuildContext context) {
    Widget productImageCarouselWidget = Container();
    Widget productDetailsInfoWidget = Container();

    return BlocProvider<ProductDetailsBloc>(
      create: (context) => ProductDetailsBloc(
          productDetailsRepositoryImpl: productDetailsRepositoryImpl)
        ..add(LoadProductDetail()),
      child: Scaffold(
        body: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
          builder: (context, state) {
            if (state is ProductDetailsLoading) {
              const CircularProgressIndicator();
            } else if (state is ProductDetailsLoaded) {
              productImageCarouselWidget = ProductImageCarouselWidget(
                images: state.productDetails.images,
              );
              productDetailsInfoWidget = ProductDetailsInfoWidget(
                productDetails: state.productDetails,
              );
            } else if (state is ProductDetailsError) {
              return Text(state.message);
            }
            return ListView(
              children: [
                const NavigationWidget(),
                productImageCarouselWidget,
                productDetailsInfoWidget,
              ],
            );
          },
        ),
      ),
    );
  }
}
