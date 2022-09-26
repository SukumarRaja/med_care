class LoginRes {
  LoginRes({
    this.status,
    this.message,
    this.data,
  });

  dynamic status;
  dynamic message;
  Data? data;

  factory LoginRes.fromMap(Map<String, dynamic> json) => LoginRes(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null ? null : data!.toMap(),
      };
}

class Data {
  Data({
    this.email,
    this.token,
  });

  dynamic email;
  dynamic token;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        email: json["email"] == null ? null : json["email"],
        token: json["token"] == null ? null : json["token"],
      );

  Map<String, dynamic> toMap() => {
        "email": email == null ? null : email,
        "token": token == null ? null : token,
      };
}
