import 'package:covid_19_tracker/presentation/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountryListShimmerEffect extends StatelessWidget {
  const CountryListShimmerEffect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return _buildShimmerEffect();
      },
    );
  }

  Widget _buildShimmerEffect() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade700,
      highlightColor: Colors.grey.shade100,
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.white,
        ),
        title: Container(
          height: 10,
          width: double.infinity,
          color: Colors.white,
        ),
        subtitle: Container(
          height: 10,
          width: SizeConfig.screenWidth! * 0.6,
          color: Colors.white,
        ),
      ),
    );
  }
}
