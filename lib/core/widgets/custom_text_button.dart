import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final String? iconName;

  const CustomTextButton({
    Key? key,
    required this.title,
    this.onPressed,
    this.iconName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).backgroundColor,
            ),
          ),
          if (iconName != null) const SizedBox(width: 2),
          if (iconName != null)
            SvgPicture.asset(
              iconName!,
              color: Theme.of(context).backgroundColor,
            ),
        ],
      ),
    );
  }
}
