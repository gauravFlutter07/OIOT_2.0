class TicketHistoryModel {
  final String ticketId;
  final String dateTime;
  final bool isPending;
  final String issueCategory;
  final String remarks;

  TicketHistoryModel({
    required this.ticketId,
    required this.dateTime,
    required this.isPending,
    required this.issueCategory,
    required this.remarks,
  });

  factory TicketHistoryModel.fromJson(Map<String, dynamic> json) {
    return TicketHistoryModel(
      ticketId: json['ticketId'],
      dateTime: json['dateTime'],
      isPending: json['isPending'],
      issueCategory: json['issueCategory'],
      remarks: json['remarks'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ticketId': ticketId,
      'dateTime': dateTime,
      'isPending': isPending,
      'issueCategory': issueCategory,
      'remarks': remarks,
    };
  }
}
