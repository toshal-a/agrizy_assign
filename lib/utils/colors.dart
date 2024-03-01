import 'dart:ui';

import 'package:flutter/material.dart';



class ColorPalette {
    static const int _primaryGreen = 0xFF22C55E;
    
    static const Color green50 = Color(0xFFF0FDF4);
    static const Color green100 = Color(0xFFDCFCE7);
    static const Color green200 = Color(0xFFBBF7D0);
    static const Color green300 = Color(0xFF86EFAC);
    static const Color green400 = Color(0xFF4ADE80);
    static const Color green500 = Color(_primaryGreen);
    static const Color green600 = Color(0xFF16A34A);
    static const Color green700 = Color(0xFF15803D);
    static const Color green800 = Color(0xFF166534);
    static const Color green900 = Color(0xFF14532D);
    static const Color green950 = Color(0xFF052E16);

    static const Color stone50 = Color(0xFFFAFAF9);
    static const Color stone100 = Color(0xFFF5F5F4);
    static const Color stone200 = Color(0xFFE7E5E4);
    static const Color stone300 = Color(0xFFD6D3D1);
    static const Color stone400 = Color(0xFFA8A29E);
    static const Color stone500 = Color(0xFF78716C);
    static const Color stone600 = Color(0xFF57534E);
    static const Color stone700 = Color(0xFF44403C);
    static const Color stone800 = Color(0xFF292524);
    static const Color stone900 = Color(0xFF1C1917);
    static const Color stone950 = Color(0xFF0C0A09);

    static const Color slate50 = Color(0xFFF8FAFC);
    static const Color slate100 = Color(0xFFF1F5F9);
    static const Color slate200 = Color(0xFFE2E8F0);
    static const Color slate300 = Color(0xFFCBD5E1);
    static const Color slate400 = Color(0xFF94A3B8);
    static const Color slate500 = Color(0xFF64748B);
    static const Color slate600 = Color(0xFF475569);
    static const Color slate700 = Color(0xFF334155);
    static const Color slate800 = Color(0xFF1E293B);
    static const Color slate900 = Color(0xFF0F172A);
    static const Color slate950 = Color(0xFF020617);



    static const Color amber700 = Color(0xFFB45309);
    static const Color backGroundColor = Color(0xFFFBFBF6);
    static const Color surfaceColor = Color(0xFFF6F6F1);

    static const MaterialColor customGreen = MaterialColor(
        _primaryGreen,
        <int, Color> {
            50: green50,
            100: green100,
            200: green200,
            300: green300,
            400: green400,
            500: green500,
            600: green600,
            700: green700,
            800: green800,
            900: green900,
        }
    );
}

extension HexColor on Color {
    /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
    static Color fromHex(String hexString) {
        final buffer = StringBuffer();
        if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
        buffer.write(hexString.replaceFirst('#', ''));
        return Color(int.parse(buffer.toString(), radix: 16));
    }

    /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
    String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
        '${alpha.toRadixString(16).padLeft(2, '0')}'
        '${red.toRadixString(16).padLeft(2, '0')}'
        '${green.toRadixString(16).padLeft(2, '0')}'
        '${blue.toRadixString(16).padLeft(2, '0')}';
}