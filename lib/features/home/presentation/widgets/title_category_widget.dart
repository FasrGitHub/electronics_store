import 'package:electronics_store/common/app_colors.dart';
import 'package:flutter/material.dart';

class TitleCategoryWidget extends StatelessWidget {
  const TitleCategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18, left: 17, right: 25),
      child: Row(
        children: [
          const Text(
            "Select Category",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),

          const Spacer(),

          TextButton(
            style: TextButton.styleFrom(
              primary: AppColors.orange,
            ),
            onPressed: () {},
            child: const Text('view all',
                style: TextStyle(fontWeight: FontWeight.normal)),
          )
        ],
      ),
    );
  }
}
