import 'package:flutter/material.dart';
import 'package:qyre_test/core/utils/assets.dart';
import 'package:qyre_test/core/widgets/empty_container.dart';
import 'package:qyre_test/features/home/widgets/productions/productions_container.dart';

class ProductionsListView extends StatelessWidget {
  ProductionsListView({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> _data = [
    {
      'title': 'Production Name That is Long',
      'place': 'Sweden',
      'date': 'Jan 14, 2022 - Feb 23, 2023',
      'image': 'image_1.png',
    },
    {
      'title': 'What has bee seen very very long te...',
      'place': 'Sweden',
      'date': 'Jan 14, 2022 - Feb 23, 2023',
      'image': 'image_2.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return _data.isNotEmpty
        ? Column(
            children: List.generate(
              _data.length,
              (index) {
                final data = _data[index];
                return ProductionsContainer(
                  title: data['title'],
                  place: data['place'],
                  date: data['date'],
                  image: data['image'],
                );
              },
            ),
          )
        : const EmptyContainer(
            title: 'All of your today’s productions will be displayed here.',
            assetName: AppAssets.productionsAssetName,
          );
  }
}
