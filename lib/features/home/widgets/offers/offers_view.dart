import 'package:flutter/material.dart';
import 'package:qyre_test/core/utils/assets.dart';
import 'package:qyre_test/core/widgets/empty_container.dart';
import 'package:qyre_test/features/home/widgets/offers/offers_container.dart';

class OffersView extends StatelessWidget {
  const OffersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> _data = [];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My job offers',
            style: Theme.of(context).textTheme.headline1,
          ),
          _data.isNotEmpty
              ? Column(
                  children: List.generate(
                    _data.length,
                    (index) => const OffersContainer(),
                  ),
                )
              : EmptyContainer(
                  title:
                      'All of your today’s productions will be displayed here.',
                  assetName: AppAssets.jobOffersAssetName,
                  buttonTitle: 'Go to my profile',
                  onPressed: () {},
                ),
        ],
      ),
    );
  }
}
