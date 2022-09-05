import 'package:electronics_store/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ModalBottomSheetFilter extends StatefulWidget {
  const ModalBottomSheetFilter({Key? key}) : super(key: key);

  @override
  State<ModalBottomSheetFilter> createState() => _ModalBottomSheetFilterState();
}

class _ModalBottomSheetFilterState extends State<ModalBottomSheetFilter> {
  final List<String> _modelsPhone = ["Samsung", "Nokia", "HONOR", "Apple"];
  RangeValues _price = RangeValues(0, 10000);
  final List<String> _sizePhone = [
    "4.5 to 5.5 inches",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 44, top: 24, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 37,
                  height: 37,
                  decoration: BoxDecoration(
                    color: AppColors.darkBlue,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Text(
                  'Filter options',
                  style: TextStyle(
                    fontSize: 23,
                  ),
                ),
                SizedBox(
                  width: 86,
                  height: 37,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(AppColors.orange),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Done',
                        style: TextStyle(
                          fontSize: 23,
                        ),
                      )),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(right: 11, top: 52),
              child: Text(
                'Brand',
                style: TextStyle(fontSize: 25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 11, top: 10),
              child: DropdownButtonFormField(
                value: _modelsPhone.first,
                icon: SvgPicture.asset('assets/icons/arrow_down.svg'),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(color: AppColors.darkBlue)),
                ),
                items: _modelsPhone.map((model) {
                  return DropdownMenuItem(
                    value: model,
                    child: Text(model),
                  );
                }).toList(),
                onChanged: (value) {},
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 11, top: 10),
              child: Text(
                'Price',
                style: TextStyle(fontSize: 25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 11, top: 10),
              //Todo возможно есть лучшее решение по диапозону цен
              child: RangeSlider(
                values: _price,
                activeColor: AppColors.orange,
                max: 10000,
                divisions: 100,
                labels: RangeLabels(
                  _price.start.round().toString(),
                  _price.end.round().toString(),
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    _price = values;
                  });
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 11, top: 10),
              child: Text(
                'Size',
                style: TextStyle(fontSize: 25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 11, top: 10),
              child: DropdownButtonFormField(
                value: _sizePhone.first,
                icon: SvgPicture.asset('assets/icons/arrow_down.svg'),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(color: AppColors.darkBlue)),
                ),
                items: _sizePhone.map((model) {
                  return DropdownMenuItem(
                    value: model,
                    child: Text(model),
                  );
                }).toList(),
                onChanged: (value) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
