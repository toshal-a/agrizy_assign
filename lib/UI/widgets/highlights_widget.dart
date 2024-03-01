import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tapinvest_assign/UI/widgets/headers/text_header.dart';
import 'package:tapinvest_assign/utils/colors.dart';
import 'package:tapinvest_assign/utils/icons.dart';
import 'package:tapinvest_assign/utils/typescale.dart';

class HighLightItem {
  String icon;
  String title;

  HighLightItem(
      {
        required this.icon,
        required this.title,
      }
  );
}

class HightLightsWidgetData {
  String? header;
  List<HighLightItem> highlights;

  HightLightsWidgetData({this.header, required this.highlights});

  factory HightLightsWidgetData.fromJson(dynamic payload) {
    return HightLightsWidgetData(
        header: payload['title'],
        highlights: payload['documents']
            .map<HighLightItem>((e) => HighLightItem(
              icon: e['icon'],
              title: e['title'],
            ))
            .toList());
  }
}

class HighLightsWidget extends StatelessWidget {
  final HightLightsWidgetData hightLightsWidgetData;

  const HighLightsWidget({super.key, required this.hightLightsWidgetData});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 24,
        left: 20,
        right: 20,
        bottom: 36,
      ),
      // clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        border: const Border(
          top: BorderSide(width: 1, color: ColorPalette.stone200),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextHeader(
            title: hightLightsWidgetData.header ?? "",
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 173,
            child: ListView(
              // shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                for (int i = 0; i < hightLightsWidgetData.highlights.length; i++)
                  Row(
                    children: [
                      HighlightCard(
                          title: hightLightsWidgetData.highlights[i].title,
                          iconName: hightLightsWidgetData.highlights[i].icon
                      ),
                      if (i < hightLightsWidgetData.highlights.length - 1)
                        const SizedBox(width: 16),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HighlightCard extends StatelessWidget {
  final String title;
  final String iconName;

  const HighlightCard({super.key, required this.title, required this.iconName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: ColorPalette.stone200),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon(iconName), color: ColorPalette.stone500, size: 25),
          const SizedBox(height: 10),
          Text(
            title,
            style: Typescale.createStyle(typescale: TypescaleValues.P5, color: ColorPalette.stone500),
          ),
        ],
      ),
    );
  }
}
