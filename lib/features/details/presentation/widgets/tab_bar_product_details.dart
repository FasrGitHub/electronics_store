import 'package:electronics_store/common/app_colors.dart';
import 'package:electronics_store/features/cart/presentation/screens/cart_screen.dart';
import 'package:electronics_store/features/details/domain/entities/product_details_entity.dart';
import 'package:electronics_store/features/details/presentation/widgets/capasity_product_widget.dart';
import 'package:electronics_store/features/details/presentation/widgets/color_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class TabBarProductDetails extends StatelessWidget {
  final ProductDetailsEntity productDetails;
  final formatter = NumberFormat('###,###,000.00');

  TabBarProductDetails({Key? key, required this.productDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const TabBar(
          labelColor: Colors.black,
          labelStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          unselectedLabelColor: Colors.grey,
          unselectedLabelStyle: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
          indicatorColor: AppColors.orange,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 3,
          indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
          tabs: [
            Tab(
              text: 'Shop',
            ),
            Tab(
              text: 'Details',
            ),
            Tab(
              text: 'Feature',
            ),
          ],
        ),
        body: TabBarView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 33),
                  child: SizedBox(
                    height: 47,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            SvgPicture.asset('assets/icons/icon_cpu.svg'),
                            const Spacer(),
                            Text(
                              productDetails.cpu,
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 11),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SvgPicture.asset('assets/icons/icon_camera.svg'),
                            const Spacer(),
                            Text(
                              productDetails.camera,
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 11),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            SvgPicture.asset('assets/icons/icon_ram.svg'),
                            const Spacer(),
                            Text(
                              productDetails.ssd,
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 11),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            SvgPicture.asset('assets/icons/icon_memory.svg'),
                            const Spacer(),
                            Text(
                              productDetails.sd,
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 11),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 30, top: 29),
                  child: Text(
                    'Select color and capacity',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                Row(
                  children: [
                    ColorProductWidget(),
                    CapacityProductWidget(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CartScreen()));
                    },
                    child: Container(
                      height: 54,
                      decoration: const BoxDecoration(
                          color: AppColors.orange,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            'Add to Cart',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '\$${formatter.format(productDetails.price)}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Center(
              child: Text('Details not implemented'),
            ),
            const Center(
              child: Text('Feature not implemented'),
            ),
          ],
        ),
      ),
    );
  }
}
