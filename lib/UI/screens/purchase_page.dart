import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tapinvest_assign/UI/screens/confirmation_page.dart';
import 'package:tapinvest_assign/UI/widgets/buttons/swipe_button.dart';
import 'package:tapinvest_assign/UI/widgets/routeTransition/slide_bottom.dart';
import 'package:tapinvest_assign/utils/colors.dart';
import 'package:tapinvest_assign/utils/icons.dart';

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
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  child: Icon(
                    icon('back_arrow'),
                    color: ColorPalette.green700,
                    size: 13,
                  ),
                )),
          ],
        ),
        centerTitle: false,
      ),
      body: Stack(
        children: [
          ListView(
            children: <Widget>[
              // CustomTextFieldWidget(
              //     labelText: "Min 50,000",
              //     prefixSymbol: "₹",
              // )
            ],
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SwipeButton(
                onSwipeComplete: () {
                  HapticFeedback.heavyImpact();
                  Navigator.of(context).push(
                      SlideFromBottomPageRoute(
                          widget: const PurchaseConfirmationScreen(),
                          duration: const Duration(milliseconds: 200),
                      ));
                },
                title: "SWIPE TO PAY",
                iconName: "right_arrow",
                topLeftText: "Balance: ₹1,00,000",
                topRightText: "Required: ₹0",
              ),
          ),
        ],
      ),
    );
  }
}
