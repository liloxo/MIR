class FormationModel {
  String? id;
  bool? isfav;
  int? favorites;
  int? groupes;
  String? teacher;
  double? reviews;
  String? city;
  String? description;
  String? location;
  String? category;
  String? categoryar;
  String? categoryfr;
  String? title;
  String? status;
  String? image;

  FormationModel(
    {this.id,
    this.isfav,
    this.favorites,
    this.groupes,
    this.teacher,
    this.reviews,
    this.city,
    this.description,
    this.location,
    this.category,
    this.categoryar,
    this.categoryfr,
    this.title,
    this.status,
    this.image});

  FormationModel.fromJson(Map<String, dynamic> json, String this.id) {
    favorites = json['favorites'];
    groupes = json['groupes'];
    teacher = json['teacher'];
    reviews = json['reviews'];
    city = json['city'];
    description = json['description'];
    location = json['location'];
    category = json['category'];
    categoryar = json['categoryar'];
    categoryfr = json['categoryfr'];
    title = json['title'];
    status = json['status'];
    image = json['imageurl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['favorites'] = favorites;
    data['groupes'] = groupes;
    data['teacher'] = teacher;
    data['reviews'] = reviews;
    data['city'] = city;
    data['description'] = description;
    data['location'] = location;
    data['category'] = category;
    data['title'] = title;
    data['status'] = status;
    return data;
  }
}