import 'package:flutter/material.dart';

class Report {
  final String label;
  final double value;
  final Color color;

  Report({
    required this.label,
    required this.value,
    required this.color,
  });

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
      label: json['label'],
      value: json['value'].toDouble(),
      color: Color(int.parse(json['color'].replaceFirst('#', '0xff'))),
    );
  }
}

class ReportDataModel {
  final Map<String, List<Report>> reports;

  ReportDataModel({required this.reports});

  factory ReportDataModel.fromJson(Map<String, dynamic> json) {
    var reports = <String, List<Report>>{};
    json['reports'].forEach(
      (key, value) {
        var reportList =
            (value as List).map((i) => Report.fromJson(i)).toList();
        reports[key] = reportList;
      },
    );
    return ReportDataModel(reports: reports);
  }
}
