import 'package:flutter/material.dart';
import 'package:tapinvest_assign/UI/widgets/headers/text_header.dart';
import 'package:tapinvest_assign/utils/colors.dart';
import 'package:tapinvest_assign/utils/icons.dart';

class LogoInfo {
  final String logoUrl;
  final double height;
  final double width;

  LogoInfo({required this.logoUrl, required this.height, required this.width});
}

class LogoListData {
  final String title;
  final List<LogoInfo> logos;
  final bool showBorder;
  final double paddingBottom;

  LogoListData({
    required this.title,
    required this.logos,
    this.showBorder = false,
    this.paddingBottom = 36.0,
  });

  factory LogoListData.fromJson(dynamic payload) {
    return LogoListData(
        title: payload['title'],
        logos: payload['logos'].map<LogoInfo>((e) => LogoInfo(
          logoUrl: e['logoUrl'],
          height: e['height'],
          width: e['width']
        )).toList(),
        showBorder: payload['showBorder'] ?? false,
        paddingBottom: payload['paddingBottom'] ?? 36.0
    );
  }

}

class LogoListWidget extends StatelessWidget {
  final LogoListData logoListData;
  const LogoListWidget({super.key, required this.logoListData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 24,
        left: 20,
        right: 20,
        bottom: logoListData.paddingBottom,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        border: logoListData.showBorder ? const Border(
          top: BorderSide(width: 1, color: ColorPalette.stone200),
        ) : null
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextHeader(
            title: logoListData.title,
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 0; i < logoListData.logos.length; i++)
                Row(
                  children: [
                    Image.asset(
                      logoListData.logos[i].logoUrl,
                      height: logoListData.logos[i].height,
                      width: logoListData.logos[i].width,
                    ),
                    if (i < logoListData.logos.length - 1)
                      const SizedBox(width: 15.00),
                  ]
                ),
            ],
          ),
        ],
      ),
    );
  }
}
