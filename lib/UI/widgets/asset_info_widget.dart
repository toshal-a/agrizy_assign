import 'package:flutter/material.dart';
import 'package:tapinvest_assign/UI/widgets/stats_grid_widget.dart';
import 'package:tapinvest_assign/utils/colors.dart';
import 'package:tapinvest_assign/utils/icons.dart';

class AssetInfoWidgetData {
  final String name;
  final String previousName;
  final String logoUrl;
  final String info;
  final StatsGridWidgetData? statsGridWidgetData;
  final String icon;

  AssetInfoWidgetData({
    required this.name,
    required this.previousName,
    required this.logoUrl,
    required this.info,
    required this.icon,
    this.statsGridWidgetData,
  });


  factory AssetInfoWidgetData.fromJson(dynamic payload) {
    return AssetInfoWidgetData(
      name: payload['name'],
      previousName: payload['previousName'],
      info: payload['info'],
      logoUrl: payload['logoUrl'],
      icon: payload['icon'],
      statsGridWidgetData: payload['statsGridWidgetData'] != null ? StatsGridWidgetData.fromJson(payload['statsGridWidgetData']) : null
    );
  }

}

class AssetInfoWidget extends StatelessWidget {
  final AssetInfoWidgetData assetInfoWidgetData;

  const AssetInfoWidget({super.key, required this.assetInfoWidgetData});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      padding: const EdgeInsets.only(left: 24, right: 20, bottom: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(assetInfoWidgetData.logoUrl, height: 90, width: 90),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.only(left: 4),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 320,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 27,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      assetInfoWidgetData.name,
                                      style: const TextStyle(
                                        color: Color(0xFF152420),
                                        fontSize: 18,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    Icon(
                                      icon(assetInfoWidgetData.icon),
                                      color: ColorPalette.stone400,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      assetInfoWidgetData.previousName,
                                      style: const TextStyle(
                                        color: Color(0xFF78716C),
                                        fontSize: 18,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          assetInfoWidgetData.info,
                          style: const TextStyle(
                            color: Color(0xFF78716C),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              if (assetInfoWidgetData.statsGridWidgetData != null)
                StatsGridWidget(statsGridWidgetData: assetInfoWidgetData.statsGridWidgetData!)
            ],
          ),
        ],
      ),
    );
  }
}
