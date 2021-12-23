
class RadiologyModel{
  int id = 0;
  String name;
  bool isChecked = false;

  RadiologyModel(
      this.id,
      this.name,
      this.isChecked
      );

  RadiologyModel.withName(this.name);

  //Add toJson and fromJson once you get the api
}