class LabBillReportModel {
  Null? uRL;
  int? billMainId;
  int? billNo;
  int? billYear;
  String? billDate;
  int? regNo;
  int? regSeries;
  int? opNo;
  int? ipNo;
  String? name;
  Null? age;
  int? gender;
  int? doctor;
  String? hospital;
  double? totalAmt;
  int? discPercent;
  double? discAmt;
  double? netAmt;
  int? testId;
  String? department;
  Null? fromDate;
  Null? toDate;
  int? testAmount;
  int? rateType;
  int? userId;
  int? deptId;
  int? delFlag;
  int? type;
  int? payType;
  Null? status;
  Null? testName;
  int? pQty;
  int? pRate;
  Null? iPYear;
  Null? admitDate;
  Null? admitTime;
  Null? dischargeDate;
  Null? dischargeTime;
  Null? surgeryDate;
  Null? remarks;
  Null? others;
  Null? cashrec;
  Null? cardRec;
  Null? upirec;

  LabBillReportModel(
      {this.uRL,
        this.billMainId,
        this.billNo,
        this.billYear,
        this.billDate,
        this.regNo,
        this.regSeries,
        this.opNo,
        this.ipNo,
        this.name,
        this.age,
        this.gender,
        this.doctor,
        this.hospital,
        this.totalAmt,
        this.discPercent,
        this.discAmt,
        this.netAmt,
        this.testId,
        this.department,
        this.fromDate,
        this.toDate,
        this.testAmount,
        this.rateType,
        this.userId,
        this.deptId,
        this.delFlag,
        this.type,
        this.payType,
        this.status,
        this.testName,
        this.pQty,
        this.pRate,
        this.iPYear,
        this.admitDate,
        this.admitTime,
        this.dischargeDate,
        this.dischargeTime,
        this.surgeryDate,
        this.remarks,
        this.others,
        this.cashrec,
        this.cardRec,
        this.upirec});

  LabBillReportModel.fromJson(Map<String, dynamic> json) {
    uRL = json['URL'];
    billMainId = json['BillMainId'];
    billNo = json['BillNo'];
    billYear = json['BillYear'];
    billDate = json['BillDate'];
    regNo = json['RegNo'];
    regSeries = json['RegSeries'];
    opNo = json['OpNo'];
    ipNo = json['IpNo'];
    name = json['Name'];
    age = json['Age'];
    gender = json['Gender'];
    doctor = json['Doctor'];
    hospital = json['Hospital'];
    totalAmt = json['TotalAmt'];
    discPercent = json['DiscPercent'];
    discAmt = json['DiscAmt'];
    netAmt = json['NetAmt'];
    testId = json['TestId'];
    department = json['Department'];
    fromDate = json['FromDate'];
    toDate = json['ToDate'];
    testAmount = json['TestAmount'];
    rateType = json['RateType'];
    userId = json['UserId'];
    deptId = json['DeptId'];
    delFlag = json['DelFlag'];
    type = json['Type'];
    payType = json['PayType'];
    status = json['Status'];
    testName = json['TestName'];
    pQty = json['PQty'];
    pRate = json['PRate'];
    iPYear = json['IPYear'];
    admitDate = json['AdmitDate'];
    admitTime = json['AdmitTime'];
    dischargeDate = json['DischargeDate'];
    dischargeTime = json['DischargeTime'];
    surgeryDate = json['SurgeryDate'];
    remarks = json['Remarks'];
    others = json['Others'];
    cashrec = json['Cashrec'];
    cardRec = json['CardRec'];
    upirec = json['Upirec'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['URL'] = this.uRL;
    data['BillMainId'] = this.billMainId;
    data['BillNo'] = this.billNo;
    data['BillYear'] = this.billYear;
    data['BillDate'] = this.billDate;
    data['RegNo'] = this.regNo;
    data['RegSeries'] = this.regSeries;
    data['OpNo'] = this.opNo;
    data['IpNo'] = this.ipNo;
    data['Name'] = this.name;
    data['Age'] = this.age;
    data['Gender'] = this.gender;
    data['Doctor'] = this.doctor;
    data['Hospital'] = this.hospital;
    data['TotalAmt'] = this.totalAmt;
    data['DiscPercent'] = this.discPercent;
    data['DiscAmt'] = this.discAmt;
    data['NetAmt'] = this.netAmt;
    data['TestId'] = this.testId;
    data['Department'] = this.department;
    data['FromDate'] = this.fromDate;
    data['ToDate'] = this.toDate;
    data['TestAmount'] = this.testAmount;
    data['RateType'] = this.rateType;
    data['UserId'] = this.userId;
    data['DeptId'] = this.deptId;
    data['DelFlag'] = this.delFlag;
    data['Type'] = this.type;
    data['PayType'] = this.payType;
    data['Status'] = this.status;
    data['TestName'] = this.testName;
    data['PQty'] = this.pQty;
    data['PRate'] = this.pRate;
    data['IPYear'] = this.iPYear;
    data['AdmitDate'] = this.admitDate;
    data['AdmitTime'] = this.admitTime;
    data['DischargeDate'] = this.dischargeDate;
    data['DischargeTime'] = this.dischargeTime;
    data['SurgeryDate'] = this.surgeryDate;
    data['Remarks'] = this.remarks;
    data['Others'] = this.others;
    data['Cashrec'] = this.cashrec;
    data['CardRec'] = this.cardRec;
    data['Upirec'] = this.upirec;
    return data;
  }
}
