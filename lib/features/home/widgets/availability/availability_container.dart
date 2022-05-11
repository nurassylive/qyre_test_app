import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qyre_test/core/utils/assets.dart';

class AvailabilityContainer extends StatelessWidget {
  final String title;
  final String buttonTitle;
  final double? status;

  const AvailabilityContainer({
    Key? key,
    required this.title,
    required this.buttonTitle,
    this.status,
  }) : super(key: key);

  Widget _makeStatusBar(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 9,
          width: 268,
          decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        ),
        Container(
          height: 9,
          width: 268 * status!,
          decoration: const BoxDecoration(color: Color(0xff87c6f5)),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(16),
      height: 136,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color(0xfff0f2f5),
      ),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).backgroundColor,
            ),
          ),
          if (status != null) _makeStatusBar(context),
          Row(
            children: [
              const Spacer(),
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {},
                child: Row(
                  children: [
                    Text(
                      buttonTitle,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).backgroundColor,
                      ),
                    ),
                    const SizedBox(width: 2),
                    SvgPicture.asset(
                      AppAssets.arrowRightIcon,
                      color: Theme.of(context).backgroundColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
