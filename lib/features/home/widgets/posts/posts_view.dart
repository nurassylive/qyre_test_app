import 'package:flutter/material.dart';
import 'package:qyre_test/core/utils/assets.dart';
import 'package:qyre_test/core/widgets/empty_container.dart';
import 'package:qyre_test/features/home/widgets/offers/offers_container.dart';

class PostsView extends StatelessWidget {
  const PostsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> _data = [];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Starred posts',
            style: Theme.of(context).textTheme.headline1,
          ),
          _data.isNotEmpty
              ? Column(
                  children: List.generate(
                    _data.length,
                    (index) => const OffersContainer(),
                  ),
                )
              : const EmptyContainer(
                  title:
                      'Posts that are extra relevant to you can be marked with a star and will be shown here for easy access.',
                  assetName: AppAssets.postsAssetName,
                ),
        ],
      ),
    );
  }
}
