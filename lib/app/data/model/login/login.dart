class LoginRes {
  LoginRes({
    this.message,
    this.idToken,
    this.ionId,
    this.userId,
    this.expiresIn,
    this.error,
    this.hospitalId,
  });

  dynamic message;
  dynamic idToken;
  dynamic ionId;
  dynamic userId;
  dynamic expiresIn;
  dynamic error;
  dynamic hospitalId;

  factory LoginRes.fromMap(Map<String, dynamic> json) => LoginRes(
        message: json["message"] == null ? null : json["message"],
        idToken: json["idToken"] == null ? null : json["idToken"],
        ionId: json["ion_id"] == null ? null : json["ion_id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        expiresIn: json["expiresIn"] == null ? null : json["expiresIn"],
        error: json["error"],
        hospitalId: json["hospital_id"] == null ? null : json["hospital_id"],
      );

  Map<String, dynamic> toMap() => {
        "message": message == null ? null : message,
        "idToken": idToken == null ? null : idToken,
        "ion_id": ionId == null ? null : ionId,
        "user_id": userId == null ? null : userId,
        "expiresIn": expiresIn == null ? null : expiresIn,
        "error": error,
        "hospital_id": hospitalId == null ? null : hospitalId,
      };
}
