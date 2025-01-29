import '../../../../../imports.dart';

class TicketDropdownFitnessWidget extends StatelessWidget {
  final String? itemType;
  final String? selectedValue;
  final String hint;
  final List<dynamic>? dataList;
  const TicketDropdownFitnessWidget(
      {required this.hint,
      this.dataList,
      this.selectedValue,
      this.itemType,
      super.key});

  @override
  Widget build(BuildContext context) {
    final otherIssueProvider =
        Provider.of<OtherIssueProvider>(context, listen: false);
    final otherIssueProviderWatch = context.watch<OtherIssueProvider>();

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.07,
      width: width * 0.94,
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: padding15,
        child: Center(
          child: DropdownButton<dynamic>(
            hint: Text(hint),
            elevation: 5,
            isExpanded: true,
            value: otherIssueProviderWatch.selectedTicketIssue,
            onChanged: (value) {
              otherIssueProviderWatch.updateSelectedValue(value);
            },
            borderRadius: BorderRadius.circular(10),
            dropdownColor: whiteColor,
            underline: Container(
              height: 0,
              color: transperentColor,
            ),
            items: otherIssueProvider.tickeIssueList
                .map((dynamic type) => DropdownMenuItem<dynamic>(
                      value: type.toString(),
                      child: Text(type.toString()),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
