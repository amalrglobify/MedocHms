class IPListingModel {
  Null? cSFlag;
  int? iPYear;
  int? iPNumber;
  int? revId;
  int? revisitId;
  int? oPSerId;
  String? oPSerName;
  String? oPNumber;
  int? patientId;
  int? doctorId;
  Null? tokenNumber;
  int? delFlag;
  String? revisitDate;
  int? userId;
  int? deptId;
  String? status;
  Null? visit;
  int? flag;
  String? patientName;
  String? gender;
  String? dOB;
  String? contact;
  String? doctorName;
  String? shiftName;
  String? fromDate;
  String? toDate;
  String? bloodGroup;

  IPListingModel(
      {this.cSFlag,
        this.iPYear,
        this.iPNumber,
        this.revId,
        this.revisitId,
        this.oPSerId,
        this.oPSerName,
        this.oPNumber,
        this.patientId,
        this.doctorId,
        this.tokenNumber,
        this.delFlag,
        this.revisitDate,
        this.userId,
        this.deptId,
        this.status,
        this.visit,
        this.flag,
        this.patientName,
        this.gender,
        this.dOB,
        this.contact,
        this.doctorName,
        this.shiftName,
        this.fromDate,
        this.toDate,
        this.bloodGroup});

  IPListingModel.fromJson(Map<String, dynamic> json) {
    cSFlag = json['CSFlag'];
    iPYear = json['IPYear'];
    iPNumber = json['IPNumber'];
    revId = json['RevId'];
    revisitId = json['RevisitId'];
    oPSerId = json['OPSerId'];
    oPSerName = json['OPSerName'];
    oPNumber = json['OPNumber'];
    patientId = json['PatientId'];
    doctorId = json['DoctorId'];
    tokenNumber = json['TokenNumber'];
    delFlag = json['DelFlag'];
    revisitDate = json['RevisitDate'];
    userId = json['UserId'];
    deptId = json['DeptId'];
    status = json['Status'];
    visit = json['Visit'];
    flag = json['Flag'];
    patientName = json['PatientName'];
    gender = json['Gender'];
    dOB = json['DOB'];
    contact = json['Contact'];
    doctorName = json['DoctorName'];
    shiftName = json['ShiftName'];
    fromDate = json['FromDate'];
    toDate = json['ToDate'];
    bloodGroup = json['BloodGroup'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CSFlag'] = this.cSFlag;
    data['IPYear'] = this.iPYear;
    data['IPNumber'] = this.iPNumber;
    data['RevId'] = this.revId;
    data['RevisitId'] = this.revisitId;
    data['OPSerId'] = this.oPSerId;
    data['OPSerName'] = this.oPSerName;
    data['OPNumber'] = this.oPNumber;
    data['PatientId'] = this.patientId;
    data['DoctorId'] = this.doctorId;
    data['TokenNumber'] = this.tokenNumber;
    data['DelFlag'] = this.delFlag;
    data['RevisitDate'] = this.revisitDate;
    data['UserId'] = this.userId;
    data['DeptId'] = this.deptId;
    data['Status'] = this.status;
    data['Visit'] = this.visit;
    data['Flag'] = this.flag;
    data['PatientName'] = this.patientName;
    data['Gender'] = this.gender;
    data['DOB'] = this.dOB;
    data['Contact'] = this.contact;
    data['DoctorName'] = this.doctorName;
    data['ShiftName'] = this.shiftName;
    data['FromDate'] = this.fromDate;
    data['ToDate'] = this.toDate;
    data['BloodGroup'] = this.bloodGroup;
    return data;
  }
}
