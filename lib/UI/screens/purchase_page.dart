import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tapinvest_assign/utils/colors.dart';
import 'package:tapinvest_assign/utils/icons.dart';
import 'package:tapinvest_assign/utils/typescale.dart';

import '../widgets/asset_info_widget.dart';
import '../widgets/buttons/text_primary_button.dart';

class PurchasePage extends StatefulWidget {
  const PurchasePage({super.key});

  @override
  State<PurchasePage> createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.backGroundColor,
        automaticallyImplyLeading: false,
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
                child: Container(
                  height: 36,
                  width: 36,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: ColorPalette.green700.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(36.0),
                  ),
                  child: Icon(
                    icon('back_arrow'),
                    color: ColorPalette.green700,
                    size: 14,
                  ),
                )),
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
            ],
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: TextPrimaryButton(
                onPressed: () {
                  HapticFeedback.selectionClick();
                  Navigator.pushNamed(context, '/protect-data-leakage');
                  // Navigator.push(context,
                  //
                  // );
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
