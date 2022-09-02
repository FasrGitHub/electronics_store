import 'package:electronics_store/common/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    bool statePhone = true;
    bool stateComputer = false;
    bool stateHealth = false;
    bool stateBooks = false;

    Widget orangeCircle = Container(
      width: 71.0,
      height: 71.0,
      decoration: const BoxDecoration(
        color: AppColors.orange,
        shape: BoxShape.circle,
      ),
    );

    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 27),
            child: GestureDetector(
              onTap: () {
              },
              child: Stack(
                children: [
                  getCategoryIcon(statePhone),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 23),
            child: Stack(
              children: [
                getCategoryIcon(stateComputer),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 23),
            child: Stack(
              children: [
                getCategoryIcon(stateHealth),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 23, right: 27),
            child: Stack(
              children: [
                getCategoryIcon(stateBooks),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getCategoryIcon(bool state) {
    if (state) {
      return _getOrangeCircle();
    } else {
      return _getWhiteCircle();
    }
  }

  Widget _getOrangeCircle() {
    return Container(
      width: 71.0,
      height: 71.0,
      decoration: const BoxDecoration(
        color: AppColors.orange,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _getWhiteCircle() {
    return Container(
      width: 71.0,
      height: 71.0,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }
}