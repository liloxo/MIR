
class ReviewsModel {
  String? name;
  String? review;
  int? stars;
  String? date;

  ReviewsModel(
    {this.name,this.review,this.stars,this.date});

  ReviewsModel.fromJson(Map<String, dynamic> json,this.date) {
    name = json['username'];
    review    = json['review'];
    stars      = json['stars'];
  }
}