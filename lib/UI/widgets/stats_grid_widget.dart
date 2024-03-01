import 'package:flutter/material.dart';
import 'package:tapinvest_assign/utils/colors.dart';

class StatsItem {
  String title;
  String? preSubTitle;
  String? postSubTitle;
  String subTitle;

  StatsItem({
    required this.title,
    required this.subTitle,
    this.preSubTitle,
    this.postSubTitle,
  });
}

class StatsGridWidgetData {
  int crossAxisCount;
  List<StatsItem> statsItems;

  StatsGridWidgetData({
    required this.crossAxisCount,
    required this.statsItems,
  });

  factory StatsGridWidgetData.fromJson(dynamic payload) {
    return StatsGridWidgetData(
        crossAxisCount: payload['crossAxisCount'],
        statsItems: payload['statsList']
            .map<StatsItem>((e) => StatsItem(
                  title: e['title'],
                  subTitle: e['subTitle'],
                  preSubTitle: e['preSubTitle'],
                  postSubTitle: e['postSubTitle'],
                ))
            .toList());
  }
}

class StatsGridWidget extends StatelessWidget {
  final StatsGridWidgetData statsGridWidgetData;

  const StatsGridWidget({super.key, required this.statsGridWidgetData});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), // Match ClipRRect radius
          color: ColorPalette.surfaceColor,
          border: Border.all(
            color: ColorPalette.stone300, // Border color
            width: 1.0, // Border width
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10), // Rounded corners
          child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: statsGridWidgetData.crossAxisCount,
            shrinkWrap: true,
            childAspectRatio: (152 / 68),
            children: [
              ...statsGridWidgetData.statsItems.map((element) {
                return StatsCard(
                  title: element.title,
                  subTitle: element.subTitle,
                  preSubTitle: element.preSubTitle,
                  postSubTitle: element.postSubTitle,
                );
              })
            ],
          ),
        )
    );
  }
}

class StatsCard extends StatelessWidget {
  final String title;
  final String? preSubTitle;
  final String? postSubTitle;
  final String subTitle;

  const StatsCard({
    super.key,
    required this.title,
    required this.subTitle,
    this.postSubTitle,
    this.preSubTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
        bottom: 12,
      ),
      decoration: BoxDecoration(
        color: ColorPalette.surfaceColor,
        border: Border.all(
          color: ColorPalette.stone300, // Border color
          width: 0.5, // Border width
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: ColorPalette.stone500,
              fontSize: 10,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              letterSpacing: 0.50,
            ),
          ),
          const SizedBox(height: 4),
          RichText(
              text: TextSpan(
            // crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              if (preSubTitle != null)
                TextSpan(
                  text: preSubTitle,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.3),
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.32,
                    height: 1.5
                  ),
                ),
              TextSpan(
                text: subTitle,
                style: const TextStyle(
                  color: ColorPalette.stone700,
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.32,
                  height: 1.5
                ),
              ),
              if (postSubTitle != null)
                TextSpan(
                  text: postSubTitle,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.3),
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.32,
                    height: 1.5
                  ),
                ),
            ],
          )),
        ],
      ),
    );
  }
}
