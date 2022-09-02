import 'package:electronics_store/features/home/presentation/widgets/modal_bottom_sheet_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LocationAndFilterWidget extends StatelessWidget {
  const LocationAndFilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 35, right: 35),
      child: Row(
        children: [
          const Spacer(),
          SvgPicture.asset('assets/icons/location.svg'),
          const SizedBox(width: 11),
          const Text(
            'Zihuatanejo, Gro',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 8),
          InkWell(
              onTap: () {},
              child: SvgPicture.asset('assets/icons/arrow_down.svg')),
          const Spacer(),
          InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30))),
                    builder: (context) => const ModalBottomSheetFilter());
              },
              child: SvgPicture.asset('assets/icons/funnel.svg')),
        ],
      ),
    );
  }
}
