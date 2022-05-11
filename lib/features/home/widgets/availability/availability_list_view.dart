import 'package:flutter/material.dart';
import 'package:qyre_test/features/home/widgets/availability/availability_container.dart';

class AvailabilityListView extends StatelessWidget {
  AvailabilityListView({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> _data = [
    {
      'title':
          'Complete your profile tooptimize your exposure in job searches.',
      'buttonTitle': 'Complete profile',
      'status': '0.7',
    },
    {
      'title': 'Connect with people you might know and extend your network.',
      'buttonTitle': 'Connect',
    },
    {
      'title': 'Get verified as an industry professional.',
      'buttonTitle': 'Get verified',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Row(
        children: List.generate(
          _data.length,
          (index) {
            final data = _data[index];
            return AvailabilityContainer(
              title: data['title'] as String,
              buttonTitle: data['buttonTitle'] as String,
              status: double.tryParse(data['status'] ?? ''),
            );
          },
        ),
      ),
    );
  }
}
