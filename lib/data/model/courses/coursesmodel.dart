class CoursesModel {
  String? formationid;
  bool? reserved;
  int? groupe;

  CoursesModel(
    {this.formationid,this.groupe,this.reserved});

  CoursesModel.fromJson(Map<String, dynamic> json) {
    formationid = json['formationid'];
    reserved    = json['reserved'];
    groupe      = json['groupe'];
  }
}