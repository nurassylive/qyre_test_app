import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qyre_test/core/widgets/custom_text_button.dart';

class EmptyContainer extends StatelessWidget {
  final String title;
  final String assetName;
  final String? buttonTitle;
  final VoidCallback? onPressed;

  const EmptyContainer({
    Key? key,
    required this.title,
    required this.assetName,
    this.buttonTitle,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: buttonTitle != null ? 128 : 90,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color(0xfff0f2f5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(assetName),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff656565),
                  ),
                  maxLines: 3,
                  softWrap: true,
                ),
                if (buttonTitle != null)
                  CustomTextButton(
                    title: buttonTitle!,
                    onPressed: onPressed,
                    iconName: 'assets/icons/arrow_right.svg',
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
