class DoctorsAvailabilityTimeSheet {
  List<DoctorsAvailabilityTimeSheetList>? doctorsAvailabilityTimeSheetList;
  bool? success;

  DoctorsAvailabilityTimeSheet({this.doctorsAvailabilityTimeSheetList, this.success});

  DoctorsAvailabilityTimeSheet.fromJson(Map<String, dynamic> json) {
    if (json['oList'] != null) {
      doctorsAvailabilityTimeSheetList = <DoctorsAvailabilityTimeSheetList>[];
      json['oList'].forEach((v) {
        doctorsAvailabilityTimeSheetList!.add(new DoctorsAvailabilityTimeSheetList.fromJson(v));
      });
    }
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.doctorsAvailabilityTimeSheetList != null) {
      data['oList'] = this.doctorsAvailabilityTimeSheetList!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    return data;
  }
}

class DoctorsAvailabilityTimeSheetList {
  int? availableId;
  int? userId;
  Null? currentDate;
  int? depId;
  String? doctors;
  Null? checkstatus;
  String? days;
  String? shift;
  String? startTime;
  String? endTime;
  int? delFlag;
  Null? statusshift;

  DoctorsAvailabilityTimeSheetList(
      {this.availableId,
        this.userId,
        this.currentDate,
        this.depId,
        this.doctors,
        this.checkstatus,
        this.days,
        this.shift,
        this.startTime,
        this.endTime,
        this.delFlag,
        this.statusshift});

  DoctorsAvailabilityTimeSheetList.fromJson(Map<String, dynamic> json) {
    availableId = json['AvailableId'];
    userId = json['UserId'];
    currentDate = json['CurrentDate'];
    depId = json['DepId'];
    doctors = json['Doctors'];
    checkstatus = json['checkstatus'];
    days = json['Days'];
    shift = json['Shift'];
    startTime = json['StartTime'];
    endTime = json['EndTime'];
    delFlag = json['DelFlag'];
    statusshift = json['Statusshift'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AvailableId'] = this.availableId;
    data['UserId'] = this.userId;
    data['CurrentDate'] = this.currentDate;
    data['DepId'] = this.depId;
    data['Doctors'] = this.doctors;
    data['checkstatus'] = this.checkstatus;
    data['Days'] = this.days;
    data['Shift'] = this.shift;
    data['StartTime'] = this.startTime;
    data['EndTime'] = this.endTime;
    data['DelFlag'] = this.delFlag;
    data['Statusshift'] = this.statusshift;
    return data;
  }
}
