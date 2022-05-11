import 'package:flutter/material.dart';
import 'package:qyre_test/features/home/widgets/productions/productions_list_view.dart';

class ProductionsView extends StatelessWidget {
  const ProductionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Today’s productions',
            style: Theme.of(context).textTheme.headline1,
          ),
          ProductionsListView(),
        ],
      ),
    );
  }
}
