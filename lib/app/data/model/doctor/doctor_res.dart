class DoctorRes {
  DoctorRes({
    this.id,
    this.image,
    this.name,
  });

  dynamic id;
  dynamic image;
  dynamic name;

  factory DoctorRes.fromMap(Map<String, dynamic> json) => DoctorRes(
        id: json["id"] == null ? null : json["id"],
        image: json["image"] == null ? null : json["image"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "image": image == null ? null : image,
        "name": name == null ? null : name,
      };
}
