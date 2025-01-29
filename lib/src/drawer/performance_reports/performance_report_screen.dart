import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../imports.dart';

class ReportScreenOne extends StatelessWidget {
  const ReportScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ReportProvider1>(
        builder: (context, provider, child) {
          return SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: padding8,
                  child: CustomHeader(
                      title: AppLocalizations.of(context)!.performanceReport),
                ),
                Padding(
                  padding: horizontalPadding25,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: lightGreyColor,
                              width: 1.0,
                            ),
                            borderRadius: circularBorderRadius10,
                          ),
                          child: DropdownButton<String>(
                            borderRadius: circularBorderRadius10,
                            elevation: 1,
                            value: provider.selectedReport,
                            hint: const Padding(
                              padding: horizontalPadding8,
                            ),
                            onChanged: (String? newValue) {
                              provider.selectReport(newValue);
                            },
                            isExpanded: true,
                            underline: const SizedBox(),
                            items: provider.dataMap.keys
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Padding(
                                  padding: horizontalPadding8,
                                  child: Text(value),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.calendar_month),
                        onPressed: () async {
                          final newDateRange = await showDateRangePicker(
                            context: context,
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2050),
                          );
                          if (newDateRange != null) {
                            provider.setSelectedDateRange(newDateRange);
                          }
                        },
                      ),
                    ],
                  ),
                ),
                if (provider.selectedDateRange != null) ...[
                  Padding(
                    padding: padding8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            '${AppLocalizations.of(context)!.selectedDateRange}: ${DateFormat.yMd().format(provider.selectedDateRange!.start)} - ${DateFormat.yMd().format(provider.selectedDateRange!.end)}',
                            style: tsSmallGrey,
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            provider.clearDateRange();
                          },
                          icon: const Icon(
                            Icons.close,
                            size: 20,
                          ),
                          color: borderGrey,
                        ),
                      ],
                    ),
                  ),
                ],
                SizedBox(
                  width: double.infinity,
                  height: 500,
                  child: SfCircularChart(
                    series: <CircularSeries>[
                      PieSeries<Report, String>(
                        radius: '60%',
                        dataSource: provider.selectedReport != null
                            ? provider.dataMap[provider.selectedReport]!
                            : [],
                        xValueMapper: (Report data, _) => data.label,
                        yValueMapper: (Report data, _) => data.value,
                        pointColorMapper: (Report data, _) => data.color,
                        dataLabelSettings: DataLabelSettings(
                          isVisible: true,
                          labelPosition: ChartDataLabelPosition.outside,
                          textStyle: tsSmallBold,
                        ),
                        dataLabelMapper: (Report data, _) =>
                            data.value.toStringAsFixed(0),
                      ),
                    ],
                    legend: Legend(
                      title: LegendTitle(
                        text: 'Chart Data',
                        textStyle: tsRegular,
                      ),
                      orientation: LegendItemOrientation.horizontal,
                      backgroundColor: blueGreyshade50,
                      height: '15',
                      position: LegendPosition.bottom,
                      isVisible: true,
                      overflowMode: LegendItemOverflowMode.wrap,
                      iconHeight: 16,
                      iconWidth: 16,
                      textStyle: tsSmall,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
