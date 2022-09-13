import 'package:electronics_store/features/cart/presentation/bloc/basket_bloc/basket_bloc.dart';
import 'package:electronics_store/features/details/presentation/bloc/product_details_bloc/product_details_bloc.dart';
import 'package:electronics_store/features/home/domain/entities/category_entity.dart';
import 'package:electronics_store/features/home/presentation/bloc/categories_bloc/categories_bloc.dart';
import 'package:electronics_store/features/home/presentation/bloc/products_bloc/products_bloc.dart';
import 'package:electronics_store/features/splash/presentation/screens/splash_screen.dart';
import 'package:electronics_store/locator_service.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'locator_service.dart';

void main()  {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductsBloc>(
          create: (context) => sl<ProductsBloc>()..add(LoadProducts()),
        ),
        BlocProvider<CategoriesBloc>(
          create: (BuildContext context) => sl<CategoriesBloc>()
            ..add(const CategoriesUpdateEvent([
              CategoryEntity(id: 1, name: "Phone"),
              CategoryEntity(id: 2, name: "Computer"),
              CategoryEntity(id: 3, name: "Health"),
              CategoryEntity(id: 4, name: "Books")
            ])),
        ),
        BlocProvider<ProductDetailsBloc>(
          create: (BuildContext context) =>
              sl<ProductDetailsBloc>()..add(LoadProductDetail()),
        ),
        BlocProvider<BasketBloc>(
          create: (context) => sl<BasketBloc>()..add(LoadBasket()),
        ),
      ],
      child: MaterialApp(
        title: 'Electronics Store',
        home: SplashScreen(),
      ),
    );
  }
}
