import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tapinvest_assign/UI/widgets/headers/text_header.dart';
import 'package:tapinvest_assign/UI/widgets/stats_grid_widget.dart';

class MetricsWidgetItem {}

class MetricsWidgetData {
  String? header;
  late Map<String, StatsGridWidgetData> metricMap;
  late List<String> metricList;

  // List<HighLightItem> highlights;

  MetricsWidgetData({
    this.header
  });

  factory MetricsWidgetData.fromJson(dynamic payload) {
    MetricsWidgetData metricWidgetData =  MetricsWidgetData(
        header: payload['title'],
    );

    Map<String, dynamic> parsedMap = payload['metricMap'];
    Map<String, StatsGridWidgetData> finalMap = {};
    List<String> finalList = [];
    parsedMap.forEach((key, value) {
      finalList.add(key);
      finalMap[key] = StatsGridWidgetData.fromJson(value);
    });

    metricWidgetData.metricMap = finalMap;
    metricWidgetData.metricList = finalList;
    return metricWidgetData;
  }
}

class MetricsWidget extends StatefulWidget {
  final MetricsWidgetData metricsWidgetData;


  const MetricsWidget({
    super.key,
    required this.metricsWidgetData
  });

  @override
  State<MetricsWidget> createState() => _MetricsWidgetState();
}

class _MetricsWidgetState extends State<MetricsWidget> {
  String _selectedMetric = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedMetric = widget.metricsWidgetData.metricList[0];
  }

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
          top: BorderSide(width: 1, color: Color(0xFFE7E5E4)),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextHeader(
                  title: widget.metricsWidgetData.header ?? "",
                ),
                const SizedBox(height: 16),
                Container(
                  height: 27,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    // mainAxisSize: MainAxisSize.min,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      for (int i = 0; i < widget.metricsWidgetData.metricList.length; i++)
                        Row(
                          children: [
                            MetricFilter(
                                isSelected: _selectedMetric == widget.metricsWidgetData.metricList[i],
                                title: widget.metricsWidgetData.metricList[i],
                                onPress: (String metric) {
                                  setState(() {
                                    _selectedMetric = metric;
                                  });
                                },
                            ),
                            if (i < widget.metricsWidgetData.metricList.length - 1)
                              const SizedBox(width: 8),
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          StatsGridWidget(
              statsGridWidgetData: widget.metricsWidgetData.metricMap[_selectedMetric]!
          )
        ],
      ),
    );
  }
}

class MetricFilter extends StatelessWidget {
  final String title;
  final Function(String)? onPress;
  final bool isSelected;

  const MetricFilter({super.key, required this.title, this.onPress, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {
        HapticFeedback.lightImpact();
        if (this.onPress != null) {
          onPress!(title);
        }
      },
      child:
      Row(
        children: [
          if (isSelected)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: ShapeDecoration(
                color: const Color(0xFF15803D),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              ),
              child: Text(
                title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.50,
                    height: 1.5
                ),
              ),
            ),
          if (!isSelected)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: ShapeDecoration(
                color: const Color(0xFFE7E5E4),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              ),
              child: Text(
                title.toUpperCase(),
                style: const TextStyle(
                    color: Color(0xFF78716C),
                    fontSize: 10,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.50,
                    height: 1.5
                ),
              ),
            ),
        ],
      ),
    );
  }
}
