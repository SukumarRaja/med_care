class AppointmentRes {
  AppointmentRes({
    this.id,
    this.patientName,
    this.doctorName,
    this.date,
    this.startTime,
    this.endTime,
    this.remarks,
    this.status,
    this.jitsiLink,
  });

  dynamic id;
  dynamic patientName;
  dynamic doctorName;
  dynamic date;
  dynamic startTime;
  dynamic endTime;
  dynamic remarks;
  dynamic status;
  dynamic jitsiLink;

  factory AppointmentRes.fromMap(Map<String, dynamic> json) => AppointmentRes(
        id: json["id"] == null ? null : json["id"],
        patientName: json["patient_name"] == null ? null : json["patient_name"],
        doctorName: json["doctor_name"] == null ? null : json["doctor_name"],
        date: json["date"] == null ? null : json["date"],
        startTime: json["start_time"] == null ? null : json["start_time"],
        endTime: json["end_time"] == null ? null : json["end_time"],
        remarks: json["remarks"] == null ? null : json["remarks"],
        status: json["status"] == null ? null : json["status"],
        jitsiLink: json["jitsi_link"] == null ? null : json["jitsi_link"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "patient_name": patientName == null ? null : patientName,
        "doctor_name": doctorName == null ? null : doctorName,
        "date": date == null ? null : date,
        "start_time": startTime == null ? null : startTime,
        "end_time": endTime == null ? null : endTime,
        "remarks": remarks == null ? null : remarks,
        "status": status == null ? null : status,
        "jitsi_link": jitsiLink == null ? null : jitsiLink,
      };
}
