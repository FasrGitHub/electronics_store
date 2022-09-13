import 'package:electronics_store/core/platform/network_info.dart';
import 'package:electronics_store/features/cart/data/datasource/basket_remote_data_source.dart';
import 'package:electronics_store/features/cart/data/repositories/basket_repository_impl.dart';
import 'package:electronics_store/features/cart/presentation/bloc/basket_bloc/basket_bloc.dart';
import 'package:electronics_store/features/cart/presentation/widgets/basket_widget.dart';
import 'package:electronics_store/features/cart/presentation/widgets/navigation_and_address_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget basketWidget = Container();

    return Scaffold(
      body: BlocBuilder<BasketBloc, BasketState>(
        builder: (context, state) {
          if (state is BasketLoading) {
            const CircularProgressIndicator();
          } else if (state is BasketLoaded) {
            basketWidget = BasketWidget(
              basket: state.basket,
            );
          } else if (state is BasketError) {
            return Text(state.message);
          }
          return ListView(
            children: [
              const NavigationAddAddressWidget(),
              const Padding(
                padding: EdgeInsets.only(left: 42, top: 50, bottom: 49),
                child: Text(
                  'My Cart',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
              basketWidget,
            ],
          );
        },
      ),
    );
  }
}
