class DashboardDetails {
  List<DashboardDetailsList>? dashboardDetailsList;
  bool? success;

  DashboardDetails({this.dashboardDetailsList, this.success});

  DashboardDetails.fromJson(Map<String, dynamic> json) {
    if (json['oList'] != null) {
      dashboardDetailsList = <DashboardDetailsList>[];
      json['oList'].forEach((v) {
        dashboardDetailsList!.add(new DashboardDetailsList.fromJson(v));
      });
    }
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dashboardDetailsList != null) {
      data['oList'] = this.dashboardDetailsList!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    return data;
  }
}

class DashboardDetailsList {
  Null? status;
  Null? amount1;
  Null? amount2;
  Null? amount3;
  Null? amount4;
  Null? amount5;
  Null? title;
  int? flag;
  Null? visit;
  Null? id;
  Null? name;
  String? appoinment;
  String? totalDoctors;
  String? availDoctors;
  String? totalPatients;
  String? newRegistration;
  String? totalRevisit;
  String? todayRevisit;
  String? admitted;
  String? newIP;
  String? discharge;
  String? rooms;
  double? labBill;
  double? procedureBill;
  Null? fromDate;
  Null? toDate;
  Null? toDay;
  int? deptId;
  int? userId;

  DashboardDetailsList(
      {this.status,
        this.amount1,
        this.amount2,
        this.amount3,
        this.amount4,
        this.amount5,
        this.title,
        this.flag,
        this.visit,
        this.id,
        this.name,
        this.appoinment,
        this.totalDoctors,
        this.availDoctors,
        this.totalPatients,
        this.newRegistration,
        this.totalRevisit,
        this.todayRevisit,
        this.admitted,
        this.newIP,
        this.discharge,
        this.rooms,
        this.labBill,
        this.procedureBill,
        this.fromDate,
        this.toDate,
        this.toDay,
        this.deptId,
        this.userId});

  DashboardDetailsList.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    amount1 = json['Amount1'];
    amount2 = json['Amount2'];
    amount3 = json['Amount3'];
    amount4 = json['Amount4'];
    amount5 = json['Amount5'];
    title = json['Title'];
    flag = json['Flag'];
    visit = json['Visit'];
    id = json['Id'];
    name = json['Name'];
    appoinment = json['Appoinment'];
    totalDoctors = json['TotalDoctors'];
    availDoctors = json['AvailDoctors'];
    totalPatients = json['TotalPatients'];
    newRegistration = json['NewRegistration'];
    totalRevisit = json['TotalRevisit'];
    todayRevisit = json['TodayRevisit'];
    admitted = json['Admitted'];
    newIP = json['NewIP'];
    discharge = json['Discharge'];
    rooms = json['Rooms'];
    labBill = json['LabBill'];
    procedureBill = json['ProcedureBill'];
    fromDate = json['FromDate'];
    toDate = json['ToDate'];
    toDay = json['ToDay'];
    deptId = json['DeptId'];
    userId = json['UserId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status'] = this.status;
    data['Amount1'] = this.amount1;
    data['Amount2'] = this.amount2;
    data['Amount3'] = this.amount3;
    data['Amount4'] = this.amount4;
    data['Amount5'] = this.amount5;
    data['Title'] = this.title;
    data['Flag'] = this.flag;
    data['Visit'] = this.visit;
    data['Id'] = this.id;
    data['Name'] = this.name;
    data['Appoinment'] = this.appoinment;
    data['TotalDoctors'] = this.totalDoctors;
    data['AvailDoctors'] = this.availDoctors;
    data['TotalPatients'] = this.totalPatients;
    data['NewRegistration'] = this.newRegistration;
    data['TotalRevisit'] = this.totalRevisit;
    data['TodayRevisit'] = this.todayRevisit;
    data['Admitted'] = this.admitted;
    data['NewIP'] = this.newIP;
    data['Discharge'] = this.discharge;
    data['Rooms'] = this.rooms;
    data['LabBill'] = this.labBill;
    data['ProcedureBill'] = this.procedureBill;
    data['FromDate'] = this.fromDate;
    data['ToDate'] = this.toDate;
    data['ToDay'] = this.toDay;
    data['DeptId'] = this.deptId;
    data['UserId'] = this.userId;
    return data;
  }
}
