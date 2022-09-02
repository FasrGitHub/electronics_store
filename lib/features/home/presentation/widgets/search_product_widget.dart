import 'package:electronics_store/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchProductWidget extends StatefulWidget {
  const SearchProductWidget({Key? key}) : super(key: key);

  @override
  State<SearchProductWidget> createState() => _SearchProductWidgetState();
}

class _SearchProductWidgetState extends State<SearchProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32, top: 35),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 82),
            child: Form(
              child: TextFormField(
                decoration: const InputDecoration(
                  filled: true,
                  labelText: "Search",
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.orange,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      borderSide: BorderSide.none),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 37),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                width: 34.0,
                height: 34.0,
                decoration: const BoxDecoration(
                  color: AppColors.orange,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset('assets/icons/qr.svg'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
