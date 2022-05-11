import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductionsContainer extends StatelessWidget {
  final String title;
  final String place;
  final String date;
  final String image;

  const ProductionsContainer({
    Key? key,
    required this.title,
    required this.place,
    required this.date,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color(0xfff0f2f5),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              bottomLeft: Radius.circular(4),
            ),
            child: Image.asset(
              'assets/images/$image',
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).backgroundColor,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          place,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff656565),
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          date,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff656565),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SvgPicture.asset(
                  'assets/icons/arrow_right.svg',
                  color: Theme.of(context).backgroundColor,
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}
