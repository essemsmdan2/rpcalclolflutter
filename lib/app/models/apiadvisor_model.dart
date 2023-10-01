class ApiAdvisorModel {
  String? country;
  String? date;
  String? text;

  ApiAdvisorModel({this.country, this.date, this.text});

  ApiAdvisorModel.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    date = json['date'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country'] = country;
    data['date'] = date;
    data['text'] = text;
    return data;
  }
}
