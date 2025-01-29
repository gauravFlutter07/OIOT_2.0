import '../../../../../imports.dart';

class TicketHistory extends StatelessWidget {
  const TicketHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: padding10,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomHeader(
                      title: AppLocalizations.of(context)!.ticketHistory),
                  Consumer<TicketHistoryProvider>(
                    builder: (context, ticketHistoryProvider, _) {
                      return DropdownButton<String>(
                        value: ticketHistoryProvider.selectedStatus,
                        onChanged: (value) {
                          ticketHistoryProvider.updateSelectedStatus(value);
                        },
                        isDense: true,
                        iconSize: 24,
                        items: <String>['All', 'Pending', 'Completed']
                            .map<DropdownMenuItem<String>>(
                              (String value) => DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              ),
                            )
                            .toList(),
                      );
                    },
                  ),
                ],
              ),
              height15,
              Consumer<TicketHistoryProvider>(
                builder: (context, ticketHistoryProvider, _) {
                  final ticketHistoryList =
                      ticketHistoryProvider.ticketHistoryList;

                  List<TicketHistoryModel> filteredList =
                      ticketHistoryProvider.selectedStatus == 'All'
                          ? ticketHistoryList
                          : ticketHistoryList
                              .where(
                                (ticket) =>
                                    (ticket.isPending &&
                                        ticketHistoryProvider.selectedStatus ==
                                            'Pending') ||
                                    (!ticket.isPending &&
                                        ticketHistoryProvider.selectedStatus ==
                                            'Completed'),
                              )
                              .toList();

                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: Column(
                      children: [
                        height15,
                        Expanded(
                          child: ListView.separated(
                            separatorBuilder: (context, index) {
                              return height10;
                            },
                            itemCount: filteredList.length,
                            itemBuilder: (context, index) {
                              final ticket = filteredList[index];
                              return TicketRow(
                                ticketId: ticket.ticketId,
                                dateTime: ticket.dateTime,
                                isPending: ticket.isPending,
                                issueCategory: ticket.issueCategory,
                                remarks: ticket.remarks,
                              );
                            },
                          ),
                        ),
                        CustomButton(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RaiseNewTicket(
                                  key: null,
                                ),
                              ),
                            );
                          },
                          title: AppLocalizations.of(context)!.raiseNewTicket,
                          border: true,
                        ),
                        height10,
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TicketRow extends StatelessWidget {
  final String ticketId;
  final String dateTime;
  final bool isPending;
  final String issueCategory;
  final String remarks;

  const TicketRow({
    super.key,
    required this.ticketId,
    required this.dateTime,
    required this.isPending,
    required this.issueCategory,
    required this.remarks,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: padding10,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${AppLocalizations.of(context)!.ticketId}: ',
                        style: tsRegularBold,
                      ),
                      Text(
                        ticketId,
                        style: tsRegular,
                      ),
                    ],
                  ),
                  height10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.dateAndTime,
                        style: tsRegularBold,
                      ),
                      Text(
                        dateTime,
                        style: tsRegular,
                      ),
                    ],
                  ),
                  height10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${AppLocalizations.of(context)!.status}: ',
                        style: tsRegularBold,
                      ),
                      Text(
                        isPending ? 'Pending' : 'Completed',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isPending ? starColor : greenColor,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  height10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${AppLocalizations.of(context)!.issueCategory}: ',
                        style: tsRegularBold,
                      ),
                      Text(
                        issueCategory,
                        style: tsRegular,
                      ),
                    ],
                  ),
                  height10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${AppLocalizations.of(context)!.remark}: ',
                        style: tsRegularBold,
                      ),
                      Text(
                        remarks,
                        style: tsRegular,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
