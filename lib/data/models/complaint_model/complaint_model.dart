class ComplaintModel {
  String? id;
  String? title;
  String? body;
  DateTime? dateTime;
  String? complainantId;

  ComplaintModel(
      {this.id, this.title, this.body, this.dateTime, this.complainantId});

  ComplaintModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    dateTime = json['date_time'];
    complainantId = json['complainant_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    data['date_time'] = dateTime;
    data['complainant_id'] = complainantId;
    return data;
  }
}
