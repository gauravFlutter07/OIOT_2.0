// To parse this JSON data, do
//
//     final cityListModal = cityListModalFromMap(jsonString);

import 'dart:convert';

List<CityListModal> cityListModalFromMap(String str) => List<CityListModal>.from(json.decode(str).map((x) => CityListModal.fromMap(x)));

String cityListModalToMap(List<CityListModal> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class CityListModal {
  final String? id;
  final bool? status;
  final bool? softDelete;
  final int? createdBy;
  final int? modifiedBy;
  final String? cityListModalId;
  final String? name;
  final String? stateId;
  final String? createdAt;
  final String? modifiedAt;
  final String? label;
  final String? value;

  CityListModal({
    this.id,
    this.status,
    this.softDelete,
    this.createdBy,
    this.modifiedBy,
    this.cityListModalId,
    this.name,
    this.stateId,
    this.createdAt,
    this.modifiedAt,
    this.label,
    this.value,
  });

  factory CityListModal.fromMap(Map<String, dynamic> json) => CityListModal(
    id: json["_id"],
    status: json["status"],
    softDelete: json["softDelete"],
    createdBy: json["createdBy"],
    modifiedBy: json["modifiedBy"],
    cityListModalId: json["id"],
    name: json["name"],
    stateId: json["state_id"],
    createdAt: json["createdAt"],
    modifiedAt: json["modifiedAt"],
    label: json["label"],
    value: json["value"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "status": status,
    "softDelete": softDelete,
    "createdBy": createdBy,
    "modifiedBy": modifiedBy,
    "id": cityListModalId,
    "name": name,
    "state_id": stateId,
    "createdAt": createdAt,
    "modifiedAt": modifiedAt,
    "label": label,
    "value": value,
  };
}
