// To parse this JSON data, do
//
//     final StateListModal = createUserSuccessModalFromMap(jsonString);

import 'dart:convert';

List<StateListModal> createUserSuccessModalFromMap(String str) => List<StateListModal>.from(json.decode(str).map((x) => StateListModal.fromMap(x)));

String createUserSuccessModalToMap(List<StateListModal> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class StateListModal {
  final String? id;
  final String? createUserSuccessModalId;
  final String? name;
  final String? countryId;
  final bool? status;
  final bool? softDelete;
  final String? createdAt;
  final int? createdBy;
  final String? modifiedAt;
  final int? modifiedBy;
  final String? label;
  final String? value;

  StateListModal({
    this.id,
    this.createUserSuccessModalId,
    this.name,
    this.countryId,
    this.status,
    this.softDelete,
    this.createdAt,
    this.createdBy,
    this.modifiedAt,
    this.modifiedBy,
    this.label,
    this.value,
  });

  factory StateListModal.fromMap(Map<String, dynamic> json) => StateListModal(
    id: json["_id"],
    createUserSuccessModalId: json["id"],
    name: json["name"],
    countryId: json["country_id"],
    status: json["status"],
    softDelete: json["softDelete"],
    createdAt: json["createdAt"],
    createdBy: json["createdBy"],
    modifiedAt: json["modifiedAt"],
    modifiedBy: json["modifiedBy"],
    label: json["label"],
    value: json["value"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "id": createUserSuccessModalId,
    "name": name,
    "country_id": countryId,
    "status": status,
    "softDelete": softDelete,
    "createdAt": createdAt,
    "createdBy": createdBy,
    "modifiedAt": modifiedAt,
    "modifiedBy": modifiedBy,
    "label": label,
    "value": value,
  };
}
