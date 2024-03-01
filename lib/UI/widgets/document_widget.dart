import 'package:flutter/material.dart';
import 'package:tapinvest_assign/UI/widgets/headers/text_header.dart';
import 'package:tapinvest_assign/utils/colors.dart';
import 'package:tapinvest_assign/utils/icons.dart';
import 'package:tapinvest_assign/utils/typescale.dart';

class DocumentItem {
  String icon;
  String title;
  String subTitle;
  String subTitleIcon;

  DocumentItem(
      {required this.icon,
      required this.subTitle,
      required this.title,
      required this.subTitleIcon});
}

class DocumentsWidgetData {
  String? header;
  List<DocumentItem> documents;

  DocumentsWidgetData({this.header, required this.documents});

  factory DocumentsWidgetData.fromJson(dynamic payload) {
    return DocumentsWidgetData(
        header: payload['title'],
        documents: payload['documents']
            .map<DocumentItem>((e) => DocumentItem(
                icon: e['icon'],
                title: e['title'],
                subTitle: e['subTitle'],
                subTitleIcon: e['subTitleIcon']))
            .toList());
  }
}

class DocumentsWidget extends StatelessWidget {
  final DocumentsWidgetData widgetData;

  const DocumentsWidget({super.key, required this.widgetData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 24,
        left: 20,
        right: 20,
        bottom: 36,
      ),
      clipBehavior: Clip.antiAlias,
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
            title: widgetData.header ?? "",
          ),
          const SizedBox(height: 16),
          for (int i = 0; i < widgetData.documents.length; i++)
            Column(
              children: [
                DocumentCard(
                    iconName: widgetData.documents[i].icon,
                    title: widgetData.documents[i].title,
                    subTitle: widgetData.documents[i].subTitle,
                    subTitleIcon: widgetData.documents[i].subTitleIcon
                ),
                if (i < widgetData.documents.length - 1)
                  const SizedBox(
                    height: 16,
                  )
              ],
            ),
        ],
      ),
    );
  }
}

class DocumentCard extends StatelessWidget {
  final String iconName;
  final String title;
  final String subTitle;
  final String subTitleIcon;

  const DocumentCard({super.key, required this.iconName, required this.title, required this.subTitle, required this.subTitleIcon});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding:
      const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side:
          const BorderSide(width: 1, color: ColorPalette.stone200),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: ShapeDecoration(
              color: ColorPalette.stone200,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(99),
              ),
            ),
            child: Icon(icon(iconName),
                color: ColorPalette.stone500, size: 22),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Typescale.createStyle(
                          typescale: TypescaleValues.P4,
                          color: ColorPalette.stone700),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subTitle,
                      style: Typescale.createStyle(
                          typescale: TypescaleValues.P5,
                          color: ColorPalette.stone500
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Icon(
                  icon(subTitleIcon),
                  color: ColorPalette.stone500,
                  size: 20),
            ],
          ),
        ],
      ),
    );
  }
}

