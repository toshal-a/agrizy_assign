import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tapinvest_assign/UI/widgets/asset_info_widget.dart';
import 'package:tapinvest_assign/UI/widgets/buttons/text_primary_button.dart';
import 'package:tapinvest_assign/UI/widgets/document_widget.dart';
import 'package:tapinvest_assign/UI/widgets/highlights_widget.dart';
import 'package:tapinvest_assign/UI/widgets/logo_list_widget.dart';
import 'package:tapinvest_assign/UI/widgets/metrics_widget.dart';
import 'package:tapinvest_assign/utils/colors.dart';
import 'package:tapinvest_assign/utils/icons.dart';
import 'package:tapinvest_assign/utils/routes.dart';
import 'package:tapinvest_assign/utils/typescale.dart';

class AssetPage extends StatefulWidget {
  const AssetPage({super.key});

  @override
  State<AssetPage> createState() => _AssetPageState();
}

class _AssetPageState extends State<AssetPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.backGroundColor,
        title: Row(
          children: [
            InkWell(
                onTap: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context); // Pop the current route if possible
                  } else {
                    SystemNavigator.pop(); // Attempt to close the app if no more routes to pop
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Icon(
                    icon('back_arrow'),
                    color: ColorPalette.green700,
                    size: 14,
                  ),
                )),
            Text("Back to Deals",
                style: Typescale.createStyle(
                  typescale: TypescaleValues.P4,
                  color: ColorPalette.green700,
                ))
          ],
        ),
        // title:
        // ),
        centerTitle: false,
        // titleTextStyle: Typescale.bold18().copyWith(color: ColorPalette.green700),
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        // title: Text(widget.title),
      ),
      body: Stack(
        children: [
          ListView(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            //
            // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
            // action in the IDE, or press "p" in the console), to see the
            // wireframe for each widget.
            // mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              AssetInfoWidget(
                assetInfoWidgetData: AssetInfoWidgetData.fromJson({
                  "name": "Agrizy",
                  "previousName": "Keshav Industries",
                  "icon": "back_arrow",
                  "logoUrl": "assets/logo.png",
                  "info": "Agrizy offers solutions across digital vendor management, and supply and value chainautomation to its agri processing units. Agrizy, a Bengaluru-based agri tech startup.",
                  "statsGridWidgetData": {
                    "crossAxisCount": 2,
                    "statsList": [
                      {
                        "title": "ACTIVE DEALS",
                        "subTitle": "6",
                        "postSubTitle": " of 18"
                      },
                      {
                        "title": "RAISED",
                        "subTitle": "6.94",
                        "postSubTitle": " Cr",
                        "preSubTitle": "₹ "
                      },
                      {
                        "title": "MATURED DEALS",
                        "subTitle": "12",
                        "postSubTitle": " of 18"
                      },
                      {
                        "title": "ON TIME PAYMENT",
                        "subTitle": "6",
                        "postSubTitle": " of 18"
                      }
                    ]
                  }
                }),
              ),
              LogoListWidget(
                  logoListData: LogoListData.fromJson({
                    "title": "Clients",
                    "logos": [
                      {
                        'logoUrl': 'assets/google_grey.png',
                        'height': 23.0,
                        'width': 67.0
                      },
                      {
                        'logoUrl': 'assets/google_grey.png',
                        'height': 23.0,
                        'width': 67.0
                      },
                      {
                        'logoUrl': 'assets/google_grey.png',
                        'height': 23.0,
                        'width': 67.0
                      },
                    ],
                    "showBorder": true,
                    "paddingBottom": 0.0
                  })
              ),
              LogoListWidget(
                  logoListData: LogoListData.fromJson({
                    "title": "Backed by",
                    "logos": [
                      {
                        'logoUrl': 'assets/google_grey.png',
                        'height': 23.0,
                        'width': 67.0
                      },
                      {
                        'logoUrl': 'assets/google_grey.png',
                        'height': 23.0,
                        'width': 67.0
                      },
                      {
                        'logoUrl': 'assets/google_grey.png',
                        'height': 23.0,
                        'width': 67.0
                      },
                    ],
                  })
              ),
              HighLightsWidget(
                  hightLightsWidgetData: HightLightsWidgetData.fromJson({
                "title": "Highlights",
                "documents": [
                  {
                    "icon": 'bulb',
                    "title":
                        'Agrizy was founded in 2021 by Vicky Dodani and Saket Chirania to provide an end-to-end solution to the agri processing market.'
                  },
                  {
                    "icon": 'bulb',
                    "title":
                        'Agrizy was founded in 2021 by Vicky Dodani and Saket Chirania to provide an end-to-end solution to the agri processing market.'
                  }
                ]
              })),
              MetricsWidget(
                metricsWidgetData: MetricsWidgetData.fromJson({
                  "title": "Key Metrics",
                  "metricMap": {
                    "FUNDING": {
                      "crossAxisCount": 2,
                      "statsList": [
                        {
                          "title": "ACTIVE DEALS",
                          "subTitle": "6",
                          "postSubTitle": " of 18"
                        },
                        {
                          "title": "RAISED",
                          "subTitle": "6.94",
                          "postSubTitle": " Cr",
                          "preSubTitle": "₹ "
                        },
                        {
                          "title": "MATURED DEALS",
                          "subTitle": "12",
                          "postSubTitle": " of 18"
                        },
                        {
                          "title": "ON TIME PAYMENT",
                          "subTitle": "6",
                          "postSubTitle": " of 18"
                        }
                      ]
                    },
                    "TRACTION": {
                      "crossAxisCount": 2,
                      "statsList": [
                        {
                          "title": "MATURED DEALS",
                          "subTitle": "12",
                          "postSubTitle": " of 18"
                        },
                        {
                          "title": "ACTIVE DEALS",
                          "subTitle": "6",
                          "postSubTitle": " of 18"
                        },
                        {
                          "title": "RAISED",
                          "subTitle": "6.94",
                          "postSubTitle": " Cr",
                          "preSubTitle": "₹ "
                        },
                        {
                          "title": "ON TIME PAYMENT",
                          "subTitle": "6",
                          "postSubTitle": " of 18"
                        }
                      ]
                    },
                    "FINANCIALS": {
                      "crossAxisCount": 2,
                      "statsList": [
                        {
                          "title": "RAISED",
                          "subTitle": "6.94",
                          "postSubTitle": " Cr",
                          "preSubTitle": "₹ "
                        },
                        {
                          "title": "MATURED DEALS",
                          "subTitle": "12",
                          "postSubTitle": " of 18"
                        },
                        {
                          "title": "ON TIME PAYMENT",
                          "subTitle": "6",
                          "postSubTitle": " of 18"
                        },
                        {
                          "title": "ACTIVE DEALS",
                          "subTitle": "6",
                          "postSubTitle": " of 18"
                        },
                      ]
                    },
                    "COMPETITION": {
                      "crossAxisCount": 2,
                      "statsList": [
                        {
                          "title": "ACTIVE DEALS",
                          "subTitle": "6",
                          "postSubTitle": " of 18"
                        },
                        {
                          "title": "MATURED DEALS",
                          "subTitle": "12",
                          "postSubTitle": " of 18"
                        },
                        {
                          "title": "ON TIME PAYMENT",
                          "subTitle": "6",
                          "postSubTitle": " of 18"
                        },
                        {
                          "title": "RAISED",
                          "subTitle": "6.94",
                          "postSubTitle": " Cr",
                          "preSubTitle": "₹ "
                        },
                      ]
                    }
                  }
                }),
              ),
              DocumentsWidget(
                widgetData: DocumentsWidgetData.fromJson({
                  "title": "Documents",
                  "documents": [
                    {
                      "icon": 'file_copy',
                      "title": 'Invoice Discounting Contract',
                      "subTitle":
                          'All the legalese surrounding this deal and how it relates to you.',
                      "subTitleIcon": "download_for_offline"
                    },
                    {
                      "icon": 'keyboard_content',
                      "title": 'Company Pitch Deck',
                      "subTitle":
                          'Read more about the company and see how they pitch to investors.',
                      "subTitleIcon": "download_for_offline"
                    },
                  ]
                }),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: TextPrimaryButton(
              onPressed: () {
                HapticFeedback.selectionClick();
                Navigator.pushNamed(context, getRouteName(RouteNames.purchasePage));
              },
              textSubtitle: "30%",
              textTitle: "FILLED",
              ctaTitle: "Tap to Invest",
            )
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.east),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
