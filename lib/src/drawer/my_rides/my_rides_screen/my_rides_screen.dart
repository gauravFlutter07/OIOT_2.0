import 'package:intl/intl.dart';
import 'package:oiot/src/drawer/my_rides/my_rides_screen/my_rides.dart';

import '../../../../imports.dart';

class MyRidesScreen extends StatelessWidget {
  const MyRidesScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final myRidesProvider = Provider.of<MyRidesProvider>(context);
    myRidesProvider.getRIdes(myRidesProvider.selectedOption);

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: padding10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomHeader(title: AppLocalizations.of(context)!.myRides),
                    /*if (myRidesProvider.selectedOption != 'Ongoing' &&
                        myRidesProvider.selectedOption != 'Scheduled')
                      InkWell(
                        onTap: () async {
                          final pickedDates = await showDateRangePicker(
                            context: context,
                            firstDate: DateTime(2022),
                            lastDate: DateTime(2100),
                          );

                          if (pickedDates != null) {
                            myRidesProvider.setDateRange(
                                pickedDates.start, pickedDates.end);
                          }
                        },
                        child: const Icon(
                          Icons.calendar_month,
                          size: 35,
                        ),
                      ),*/
                  ],
                ),
              ),
              _buildSelectedDateText(
                  myRidesProvider.startDate,
                  myRidesProvider.endDate,
                  context,
                  myRidesProvider.selectedOption),
              height05,
              _DropDownMenu(myRidesProvider: myRidesProvider),
              height05,
              _buildSelectedWidget(myRidesProvider.selectedOption),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSelectedDateText(DateTime? startDate, DateTime? endDate,
      BuildContext context, String selectedOption) {
    final myRidesProvider = Provider.of<MyRidesProvider>(context);

    final isDateRangeVisible = startDate != null &&
        endDate != null &&
        selectedOption != 'Ongoing' &&
        selectedOption != 'Scheduled';

    return isDateRangeVisible
        ? Padding(
            padding: horizontalPadding10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '${AppLocalizations.of(context)!.selectedDateRange}: ${DateFormat('dd-MM-yyyy').format(startDate)} - ${DateFormat('dd-MM-yyyy').format(endDate)}',
                  style: tsSmallBold,
                ),
                IconButton(
                  onPressed: () {
                    myRidesProvider.clearDateRange();
                  },
                  icon: const Icon(
                    Icons.cancel,
                  ),
                ),
              ],
            ),
          )
        : const SizedBox();
  }

  Widget _buildSelectedWidget(String selectedOption) {
    switch (selectedOption) {
      /*case 'Ongoing':
        return const OngoingRides();*/
      case 'Past':
        return const PastRides();
      /*case 'Cancelled':
        return const CancelledRides();*/
      case 'Scheduled':
        return const ScheduledRides();
      default:
        return Container();
    }
  }
}

class _DropDownMenu extends StatelessWidget {
  final MyRidesProvider myRidesProvider;

  const _DropDownMenu({required this.myRidesProvider});

  @override
  Widget build(BuildContext context) {
    final List<String> options = [
      // 'Ongoing',
      'Past',
      // 'Cancelled',
      'Scheduled'];

    return Padding(
      padding: horizontalPadding15,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: greyColor),
          borderRadius: circularBorderRadius5,
        ),
        child: Padding(
          padding: padding12,
          child: DropdownButton<String>(
            underline: const SizedBox(),
            value: myRidesProvider.selectedOption,
            onChanged: (String? newValue) {
              if (newValue != null) {
                myRidesProvider.setSelectedOption(newValue);
              }
            },
            items: options.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: SizedBox(
                  width: 100,
                  child: Text(value),
                ),
              );
            }).toList(),
            isExpanded: true,
          ),
        ),
      ),
    );
  }
}

Widget popupRow({
  String? leadtext,
  String? trailtext,
  Color? lc,
  Color? tc,
  double? ls,
  double? ts,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      customTextWidget(
        text: leadtext!,
        size: ls ?? 16.0,
        color: lc ?? blackColor,
        weight: bold,
      ),
      customTextWidget(
        text: trailtext!,
        size: ts ?? 16.0,
        color: tc ?? blackColor,
        weight: bold,
      ),
    ],
  );
}

