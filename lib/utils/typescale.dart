import 'package:flutter/material.dart';

enum TypescaleValues {
  H1,
  H2,
  H3,
  H4,
  H5,
  H7,
  H8,
  H9,
  H10,
  H11,
  H12,
  P1,
  P2,
  P3,
  P4,
  P5,
  P6,
  P7,
  P8,
  P9,
  P10,
  TAGTEXT,
}

enum StyleOverride { CTA }

const guidelineBaseWidth = 375;
const guidelineBaseHeight = 667;

double scale(BuildContext context, double value) {
  Size screenSize = MediaQuery.of(context).size;
  final wscale = screenSize.width / guidelineBaseWidth;
  return (value * wscale).roundToDouble();
}

double scaleWithWidth(double value, double width) {
  final wscale = width / guidelineBaseWidth;
  return (value * wscale).roundToDouble();
}

double scaleWithHeight(double value, double height) {
  final wscale = height / guidelineBaseHeight;
  return (value * wscale).roundToDouble();
}

double scaleHeight(BuildContext context, double value) {
  Size screenSize = MediaQuery.of(context).size;
  final wscale = screenSize.height / guidelineBaseHeight;
  return (value * wscale).roundToDouble();
}

class FontConfig {
  final double size;
  final FontWeight weight;
  final FontStyle? style;
  final String family;
  final double? spacing;
  final double? lineHeight;
  FontConfig(
      {required this.size,
        required this.weight,
        this.family = 'Inter',
        this.spacing,
        this.lineHeight,
        this.style});

  @override
  String toString() {
    return '${this.weight.toString()} • ${this.size.toInt()}px';
  }
}

class Typescale {
  static Map<TypescaleValues, FontConfig> styles = {
    TypescaleValues.H1: FontConfig(
        size: 20, weight: FontWeight.w700, spacing: -0.25, lineHeight: 1.2),
    TypescaleValues.H2: FontConfig(
        size: 18, weight: FontWeight.w700, spacing: -0.2, lineHeight: 1.2),
    TypescaleValues.H3: FontConfig(
        size: 18, weight: FontWeight.w500, spacing: -0.2, lineHeight: 1.2),
    TypescaleValues.H4:
    FontConfig(size: 16, weight: FontWeight.w700, lineHeight: 1.35),
    TypescaleValues.H5: FontConfig(
        size: 50, weight: FontWeight.w900, spacing: 0.5, lineHeight: 1.2),
    TypescaleValues.H7: FontConfig(
        size: 38, weight: FontWeight.w900, spacing: -0.3, lineHeight: 1.1),
    TypescaleValues.H8: FontConfig(
        size: 35, weight: FontWeight.w500, spacing: -1, lineHeight: 1.2),
    TypescaleValues.H9: FontConfig(
        size: 24, weight: FontWeight.w800, spacing: -0.3, lineHeight: 1.2),
    TypescaleValues.H10: FontConfig(
        size: 30, weight: FontWeight.w700, spacing: -0.5, lineHeight: 1.2),
    TypescaleValues.H11: FontConfig(
        size: 28, weight: FontWeight.w500, spacing: -0.3, lineHeight: 1.08),
    TypescaleValues.H12: FontConfig(
        size: 35, weight: FontWeight.w900, spacing: -0.3, lineHeight: 1.2),
    TypescaleValues.P1:
    FontConfig(size: 16, weight: FontWeight.w500, lineHeight: 1.5),
    TypescaleValues.P2:
    FontConfig(size: 16, weight: FontWeight.w400, lineHeight: 1.3),
    TypescaleValues.P3:
    FontConfig(size: 14, weight: FontWeight.w700, lineHeight: 1.3),
    TypescaleValues.P4:
    FontConfig(size: 14, weight: FontWeight.w500, lineHeight: 1.57),
    TypescaleValues.P5:
    FontConfig(size: 14, weight: FontWeight.w400, lineHeight: 1.3),
    TypescaleValues.P6:
    FontConfig(size: 12, weight: FontWeight.w700, lineHeight: 1.3),
    TypescaleValues.P7:
    FontConfig(size: 12, weight: FontWeight.w500, lineHeight: 1.3),
    TypescaleValues.P8:
    FontConfig(size: 12, weight: FontWeight.w400, lineHeight: 1.3),
    TypescaleValues.P9: FontConfig(
        size: 14,
        weight: FontWeight.w400,
        style: FontStyle.italic,
        lineHeight: 1.6),
    TypescaleValues.P10:
    FontConfig(size: 10, weight: FontWeight.w400, lineHeight: 1.3),
    TypescaleValues.TAGTEXT: FontConfig(
        size: 10, weight: FontWeight.w700, lineHeight: 1.3, spacing: 0.5),
  };

  static TextStyle bold20({Color? color}) {
    return TextStyle(
        fontSize: 20.0,
        letterSpacing: -0.24,
        fontWeight: FontWeight.w700,
        color: color ?? Colors.black);
  }

  static TextStyle bold18({Color? color}) {
    return TextStyle(
        fontSize: 18.0,
        letterSpacing: -0.24,
        fontWeight: FontWeight.w700,
        color: color ?? Colors.black);
  }

  // Typescale() {
  //   styles =
  // }

  static TextStyle createStyle(
      {required TypescaleValues typescale,
        required Color color,
        StyleOverride? styleOverride,
        TextDecoration? decoration,
        List<Shadow>? shadows,
        double? deviceWidth}) {
    FontConfig fontStyle = styles[typescale]!;
    return TextStyle(
        color: color,
        height: fontStyle.lineHeight,
        letterSpacing:
        styleOverride == StyleOverride.CTA ? 0.5 : fontStyle.spacing,
        fontFamily: fontStyle.family,
        fontSize: deviceWidth != null
            ? scaleWithWidth(fontStyle.size, deviceWidth)
            : fontStyle.size,
        fontStyle: fontStyle.style,
        decoration: decoration,
        shadows: shadows,
        fontWeight: fontStyle.weight);
  }
}
