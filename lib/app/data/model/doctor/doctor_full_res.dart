class DoctorFullRes {
  DoctorFullRes({
    this.id,
    this.imgUrl,
    this.name,
    this.email,
    this.address,
    this.phone,
    this.department,
    this.profile,
    this.x,
    this.y,
    this.ionUserId,
    this.hospitalId,
    this.departmentName,
    this.appointmentConfirmation,
    this.signature,
  });

  dynamic id;
  dynamic imgUrl;
  dynamic name;
  dynamic email;
  dynamic address;
  dynamic phone;
  dynamic department;
  dynamic profile;
  dynamic x;
  dynamic y;
  dynamic ionUserId;
  dynamic hospitalId;
  dynamic departmentName;
  dynamic appointmentConfirmation;
  dynamic signature;

  factory DoctorFullRes.fromMap(Map<String, dynamic> json) => DoctorFullRes(
        id: json["id"] == null ? null : json["id"],
        imgUrl: json["img_url"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        address: json["address"] == null ? null : json["address"],
        phone: json["phone"] == null ? null : json["phone"],
        department: json["department"] == null ? null : json["department"],
        profile: json["profile"] == null ? null : json["profile"],
        x: json["x"] == null ? null : json["x"],
        y: json["y"] == null ? null : json["y"],
        ionUserId: json["ion_user_id"] == null ? null : json["ion_user_id"],
        hospitalId: json["hospital_id"] == null ? null : json["hospital_id"],
        departmentName:
            json["department_name"] == null ? null : json["department_name"],
        appointmentConfirmation: json["appointment_confirmation"] == null
            ? null
            : json["appointment_confirmation"],
        signature: json["signature"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "img_url": imgUrl,
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "address": address == null ? null : address,
        "phone": phone == null ? null : phone,
        "department": department == null ? null : department,
        "profile": profile == null ? null : profile,
        "x": x == null ? null : x,
        "y": y == null ? null : y,
        "ion_user_id": ionUserId == null ? null : ionUserId,
        "hospital_id": hospitalId == null ? null : hospitalId,
        "department_name": departmentName == null ? null : departmentName,
        "appointment_confirmation":
            appointmentConfirmation == null ? null : appointmentConfirmation,
        "signature": signature,
      };
}
