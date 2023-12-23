class RegisterModel {
  String? duration;
  int? reserved;
  String? price;
  int? seats;
  String? status;

  RegisterModel(
    {this.duration, this.reserved, this.price, this.seats, this.status});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    duration = json['duration'];
    reserved = json['reserved'];
    price = json['price'];
    seats = json['seats'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['duration'] = duration;
    data['reserved'] = reserved;
    data['price'] = price;
    data['seats'] = seats;
    data['status'] = status;
    return data;
  }
}