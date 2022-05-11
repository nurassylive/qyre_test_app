import 'package:flutter/material.dart';
import 'package:qyre_test/core/utils/assets.dart';
import 'package:qyre_test/core/widgets/custom_button.dart';

class ActivitiesView extends StatelessWidget {
  const ActivitiesView({Key? key}) : super(key: key);

  Gradient _getGradient(int index) {
    if (index == 0) {
      return const LinearGradient(
        colors: [
          Color(0xff3465c3),
          Color(0xff5785de),
        ],
        stops: [0.0, 1.0],
        begin: FractionalOffset.topCenter,
        end: FractionalOffset.bottomCenter,
      );
    }
    if (index == 1) {
      return const LinearGradient(
        colors: [
          Color(0xffec4e27),
          Color(0xfff47e61),
        ],
        stops: [0.0, 1.0],
        begin: FractionalOffset.topCenter,
        end: FractionalOffset.bottomCenter,
      );
    }
    return const LinearGradient(
      colors: [
        Color(0xff6b34c3),
        Color(0xff8e5edb),
      ],
      stops: [0.0, 1.0],
      begin: FractionalOffset.topCenter,
      end: FractionalOffset.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final buttonWidth = (width - 10 * 4) / 3;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomButton(
            width: buttonWidth,
            gradient: _getGradient(0),
            assetName: AppAssets.myNetworkAssetName,
            title: 'My network',
            subtitle: 'Connect and grow your network',
          ),
          CustomButton(
            width: buttonWidth,
            gradient: _getGradient(1),
            assetName: AppAssets.quickHireAssetName,
            title: 'Quick hire',
            subtitle: 'Hire someone quickly today',
          ),
          CustomButton(
            width: buttonWidth,
            gradient: _getGradient(2),
            assetName: AppAssets.myCVAssetName,
            title: 'My CV',
            subtitle: 'Keep your CV updated to get relevant offers',
          ),
        ],
      ),
    );
  }
}
