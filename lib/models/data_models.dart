class Notes {
  String? id;
  String? title;
  String? description;

  Notes({this.title, this.description});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;

    return data;
  }
}
