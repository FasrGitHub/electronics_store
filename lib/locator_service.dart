import 'package:electronics_store/core/platform/network_info.dart';
import 'package:electronics_store/features/cart/data/datasource/basket_remote_data_source.dart';
import 'package:electronics_store/features/cart/data/repositories/basket_repository_impl.dart';
import 'package:electronics_store/features/cart/domain/repositories/basket_repository.dart';
import 'package:electronics_store/features/cart/domain/usecases/get_basket_details.dart';
import 'package:electronics_store/features/cart/presentation/bloc/basket_bloc/basket_bloc.dart';
import 'package:electronics_store/features/details/data/datasource/product_details_remote_data_source.dart';
import 'package:electronics_store/features/details/data/repositories/product_details_repository_impl.dart';
import 'package:electronics_store/features/details/domain/repositories/product_details_repository.dart';
import 'package:electronics_store/features/details/domain/usecases/get_product_details.dart';
import 'package:electronics_store/features/details/presentation/bloc/capacity_product_bloc/capacity_product_bloc.dart';
import 'package:electronics_store/features/details/presentation/bloc/colors_product_bloc/colors_product_bloc.dart';
import 'package:electronics_store/features/details/presentation/bloc/product_details_bloc/product_details_bloc.dart';
import 'package:electronics_store/features/home/data/datasources/products_remote_data_source.dart';
import 'package:electronics_store/features/home/data/repositories/product_repository_impl.dart';
import 'package:electronics_store/features/home/domain/repositories/product_repository.dart';
import 'package:electronics_store/features/home/domain/usecases/get_all_products.dart';
import 'package:electronics_store/features/home/presentation/bloc/categories_bloc/categories_bloc.dart';
import 'package:electronics_store/features/home/presentation/bloc/products_bloc/products_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl = GetIt.instance;

init() {
  /// BLoC / Cubit
  sl.registerFactory(
    () => ProductsBloc(getAllProducts: sl<GetAllProducts>()),
  );
  sl.registerFactory(() => CategoriesBloc());
  sl.registerFactory(
    () => ProductDetailsBloc(getProductDetails: sl<GetProductDetails>()),
  );
  sl.registerFactory(() => ColorsProductBloc());
  sl.registerFactory(() => CapacityProductBloc());
  sl.registerFactory(
      () => BasketBloc(getBasketDetails: sl<GetBasketDetails>()));

  /// UseCases
  sl.registerLazySingleton(() => GetAllProducts(sl()));
  sl.registerLazySingleton(() => GetProductDetails(sl()));
  sl.registerLazySingleton(() => GetBasketDetails(sl()));

  /// Repositories
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(
      productsRemote: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => ProductsRemoteDataSource(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<ProductDetailsRepository>(
    () => ProductDetailsRepositoryImpl(
      productDetailsRemote: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => ProductDetailsRemoteDataSource(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<BasketRepository>(
        () => BasketRepositoryImpl(
      basketRemoute: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton(
        () => BasketRemoteDataSource(
      client: sl(),
    ),
  );

  /// Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(sl()),
  );

  /// External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
