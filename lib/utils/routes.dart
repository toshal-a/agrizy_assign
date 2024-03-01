import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:tapinvest_assign/UI/screens/asset_page.dart';
import 'package:tapinvest_assign/UI/screens/purchase_page.dart';

enum RouteNames {
    purchasePage,
    confirmationPage,
}

String getRouteName(RouteNames routeName) {
    return '/${EnumToString.convertToString(routeName)}';
}

Map<String, WidgetBuilder> getRoutes() {
    return {
        '/': (context) => const AssetPage(),
        getRouteName(RouteNames.purchasePage): (context) => const PurchasePage(),
    };
}