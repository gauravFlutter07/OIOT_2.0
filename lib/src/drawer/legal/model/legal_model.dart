class LegalModel {
  String? sId;
  String? title;
  String? section;
  String? desc;
  String? link;
  String? type;
  int? iV;

  LegalModel(
      {this.sId,
      this.title,
      this.section,
      this.desc,
      this.link,
      this.type,
      this.iV});

  LegalModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    section = json['section'];
    desc = json['desc'];
    link = json['link'];
    type = json['type'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['section'] = this.section;
    data['desc'] = this.desc;
    data['link'] = this.link;
    data['type'] = this.type;
    data['__v'] = this.iV;
    return data;
  }
}
