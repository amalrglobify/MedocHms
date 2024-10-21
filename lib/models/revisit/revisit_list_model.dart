class RevisitListingModel {
  Null? oPCaseSheet;
  Null? iPCaseSheet;
  int? revId;
  int? revisitId;
  int? oPSerId;
  Null? oPSerName;
  String? oPNumber;
  int? patientId;
  int? doctorId;
  double? visitFees;
  double? consultFees;
  double? otherFees;
  String? shift;
  String? tokenNumber;
  String? type;
  String? weight;
  String? height;
  int? delFlag;
  String? revisitDate;
  int? userId;
  int? deptId;
  Null? status;
  int? flag;
  String? patientName;
  String? gender;
  String? dOB;
  Null? age;
  Null? bloodGroup;
  String? contact;
  Null? lastVisit;
  Null? fname;
  Null? mname;
  Null? foccupation;
  Null? moccupation;
  Null? uCVARight;
  Null? uCVALeft;
  Null? pHRight;
  Null? pHLeft;
  Null? bCVARight;
  Null? bCVALeft;
  Null? aRRight;
  Null? aRLeft;
  Null? lensPowerRight;
  Null? lensPowerLeft;
  Null? dilatedObjRight;
  Null? dilatedObjLeft;
  Null? unDilatedObjRight;
  Null? unDilatedObjLeft;
  Null? dilatedSubRight;
  Null? dilatedSubLeft;
  Null? acceptingRight;
  Null? acceptingLeft;
  Null? iOPRight;
  Null? iOPLeft;
  Null? colourRight;
  Null? colourLeft;
  Null? cheifComplaints;
  Null? confrontationRight;
  Null? confrontationLeft;
  Null? amslerRight;
  Null? amslerLeft;
  Null? gRBS;
  Null? hCIRCUMFERENCE;
  Null? sPHRight;
  Null? sPHLeft;
  Null? cYLRight;
  Null? cYLLeft;
  Null? aXISRight;
  Null? aXISLeft;
  Null? aDERight;
  Null? aDELeft;
  Null? regDate;
  String? add1;
  Null? add2;
  Null? add3;
  String? aadharNo;
  String? healthCard;
  Null? occupation;
  String? doctorName;
  String? shiftName;
  Null? fromDate;
  Null? toDate;
  int? iPNumber;
  int? iPYear;
  Null? sendSMS;
  Null? specialFees;
  String? bP;
  String? temperature;
  String? sugar;
  Null? bMI;
  Null? chestCircumference;
  Null? headCircumference;
  Null? abdominal;
  Null? allergy;
  double? cash;
  double? upi;
  double? card;

  RevisitListingModel(
      {this.oPCaseSheet,
        this.iPCaseSheet,
        this.revId,
        this.revisitId,
        this.oPSerId,
        this.oPSerName,
        this.oPNumber,
        this.patientId,
        this.doctorId,
        this.visitFees,
        this.consultFees,
        this.otherFees,
        this.shift,
        this.tokenNumber,
        this.type,
        this.weight,
        this.height,
        this.delFlag,
        this.revisitDate,
        this.userId,
        this.deptId,
        this.status,
        this.flag,
        this.patientName,
        this.gender,
        this.dOB,
        this.age,
        this.bloodGroup,
        this.contact,
        this.lastVisit,
        this.fname,
        this.mname,
        this.foccupation,
        this.moccupation,
        this.uCVARight,
        this.uCVALeft,
        this.pHRight,
        this.pHLeft,
        this.bCVARight,
        this.bCVALeft,
        this.aRRight,
        this.aRLeft,
        this.lensPowerRight,
        this.lensPowerLeft,
        this.dilatedObjRight,
        this.dilatedObjLeft,
        this.unDilatedObjRight,
        this.unDilatedObjLeft,
        this.dilatedSubRight,
        this.dilatedSubLeft,
        this.acceptingRight,
        this.acceptingLeft,
        this.iOPRight,
        this.iOPLeft,
        this.colourRight,
        this.colourLeft,
        this.cheifComplaints,
        this.confrontationRight,
        this.confrontationLeft,
        this.amslerRight,
        this.amslerLeft,
        this.gRBS,
        this.hCIRCUMFERENCE,
        this.sPHRight,
        this.sPHLeft,
        this.cYLRight,
        this.cYLLeft,
        this.aXISRight,
        this.aXISLeft,
        this.aDERight,
        this.aDELeft,
        this.regDate,
        this.add1,
        this.add2,
        this.add3,
        this.aadharNo,
        this.healthCard,
        this.occupation,
        this.doctorName,
        this.shiftName,
        this.fromDate,
        this.toDate,
        this.iPNumber,
        this.iPYear,
        this.sendSMS,
        this.specialFees,
        this.bP,
        this.temperature,
        this.sugar,
        this.bMI,
        this.chestCircumference,
        this.headCircumference,
        this.abdominal,
        this.allergy,
        this.cash,
        this.upi,
        this.card});

  RevisitListingModel.fromJson(Map<String, dynamic> json) {
    oPCaseSheet = json['OPCaseSheet'];
    iPCaseSheet = json['IPCaseSheet'];
    revId = json['RevId'];
    revisitId = json['RevisitId'];
    oPSerId = json['OPSerId'];
    oPSerName = json['OPSerName'];
    oPNumber = json['OPNumber'];
    patientId = json['PatientId'];
    doctorId = json['DoctorId'];
    visitFees = json['VisitFees'];
    consultFees = json['ConsultFees'];
    otherFees = json['OtherFees'];
    shift = json['Shift'];
    tokenNumber = json['TokenNumber'];
    type = json['Type'];
    weight = json['Weight'];
    height = json['Height'];
    delFlag = json['DelFlag'];
    revisitDate = json['RevisitDate'];
    userId = json['UserId'];
    deptId = json['DeptId'];
    status = json['Status'];
    flag = json['Flag'];
    patientName = json['PatientName'];
    gender = json['Gender'];
    dOB = json['DOB'];
    age = json['Age'];
    bloodGroup = json['BloodGroup'];
    contact = json['Contact'];
    lastVisit = json['LastVisit'];
    fname = json['Fname'];
    mname = json['Mname'];
    foccupation = json['Foccupation'];
    moccupation = json['Moccupation'];
    uCVARight = json['UCVARight'];
    uCVALeft = json['UCVALeft'];
    pHRight = json['PHRight'];
    pHLeft = json['PHLeft'];
    bCVARight = json['BCVARight'];
    bCVALeft = json['BCVALeft'];
    aRRight = json['ARRight'];
    aRLeft = json['ARLeft'];
    lensPowerRight = json['LensPowerRight'];
    lensPowerLeft = json['LensPowerLeft'];
    dilatedObjRight = json['DilatedObjRight'];
    dilatedObjLeft = json['DilatedObjLeft'];
    unDilatedObjRight = json['UnDilatedObjRight'];
    unDilatedObjLeft = json['UnDilatedObjLeft'];
    dilatedSubRight = json['DilatedSubRight'];
    dilatedSubLeft = json['DilatedSubLeft'];
    acceptingRight = json['AcceptingRight'];
    acceptingLeft = json['AcceptingLeft'];
    iOPRight = json['IOPRight'];
    iOPLeft = json['IOPLeft'];
    colourRight = json['ColourRight'];
    colourLeft = json['ColourLeft'];
    cheifComplaints = json['CheifComplaints'];
    confrontationRight = json['ConfrontationRight'];
    confrontationLeft = json['ConfrontationLeft'];
    amslerRight = json['AmslerRight'];
    amslerLeft = json['AmslerLeft'];
    gRBS = json['GRBS'];
    hCIRCUMFERENCE = json['HCIRCUMFERENCE'];
    sPHRight = json['SPHRight'];
    sPHLeft = json['SPHLeft'];
    cYLRight = json['CYLRight'];
    cYLLeft = json['CYLLeft'];
    aXISRight = json['AXISRight'];
    aXISLeft = json['AXISLeft'];
    aDERight = json['ADERight'];
    aDELeft = json['ADELeft'];
    regDate = json['RegDate'];
    add1 = json['Add1'];
    add2 = json['Add2'];
    add3 = json['Add3'];
    aadharNo = json['AadharNo'];
    healthCard = json['HealthCard'];
    occupation = json['Occupation'];
    doctorName = json['DoctorName'];
    shiftName = json['ShiftName'];
    fromDate = json['FromDate'];
    toDate = json['ToDate'];
    iPNumber = json['IPNumber'];
    iPYear = json['IPYear'];
    sendSMS = json['SendSMS'];
    specialFees = json['SpecialFees'];
    bP = json['BP'];
    temperature = json['Temperature'];
    sugar = json['Sugar'];
    bMI = json['BMI'];
    chestCircumference = json['ChestCircumference'];
    headCircumference = json['HeadCircumference'];
    abdominal = json['Abdominal'];
    allergy = json['Allergy'];
    cash = json['Cash'];
    upi = json['Upi'];
    card = json['Card'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['OPCaseSheet'] = this.oPCaseSheet;
    data['IPCaseSheet'] = this.iPCaseSheet;
    data['RevId'] = this.revId;
    data['RevisitId'] = this.revisitId;
    data['OPSerId'] = this.oPSerId;
    data['OPSerName'] = this.oPSerName;
    data['OPNumber'] = this.oPNumber;
    data['PatientId'] = this.patientId;
    data['DoctorId'] = this.doctorId;
    data['VisitFees'] = this.visitFees;
    data['ConsultFees'] = this.consultFees;
    data['OtherFees'] = this.otherFees;
    data['Shift'] = this.shift;
    data['TokenNumber'] = this.tokenNumber;
    data['Type'] = this.type;
    data['Weight'] = this.weight;
    data['Height'] = this.height;
    data['DelFlag'] = this.delFlag;
    data['RevisitDate'] = this.revisitDate;
    data['UserId'] = this.userId;
    data['DeptId'] = this.deptId;
    data['Status'] = this.status;
    data['Flag'] = this.flag;
    data['PatientName'] = this.patientName;
    data['Gender'] = this.gender;
    data['DOB'] = this.dOB;
    data['Age'] = this.age;
    data['BloodGroup'] = this.bloodGroup;
    data['Contact'] = this.contact;
    data['LastVisit'] = this.lastVisit;
    data['Fname'] = this.fname;
    data['Mname'] = this.mname;
    data['Foccupation'] = this.foccupation;
    data['Moccupation'] = this.moccupation;
    data['UCVARight'] = this.uCVARight;
    data['UCVALeft'] = this.uCVALeft;
    data['PHRight'] = this.pHRight;
    data['PHLeft'] = this.pHLeft;
    data['BCVARight'] = this.bCVARight;
    data['BCVALeft'] = this.bCVALeft;
    data['ARRight'] = this.aRRight;
    data['ARLeft'] = this.aRLeft;
    data['LensPowerRight'] = this.lensPowerRight;
    data['LensPowerLeft'] = this.lensPowerLeft;
    data['DilatedObjRight'] = this.dilatedObjRight;
    data['DilatedObjLeft'] = this.dilatedObjLeft;
    data['UnDilatedObjRight'] = this.unDilatedObjRight;
    data['UnDilatedObjLeft'] = this.unDilatedObjLeft;
    data['DilatedSubRight'] = this.dilatedSubRight;
    data['DilatedSubLeft'] = this.dilatedSubLeft;
    data['AcceptingRight'] = this.acceptingRight;
    data['AcceptingLeft'] = this.acceptingLeft;
    data['IOPRight'] = this.iOPRight;
    data['IOPLeft'] = this.iOPLeft;
    data['ColourRight'] = this.colourRight;
    data['ColourLeft'] = this.colourLeft;
    data['CheifComplaints'] = this.cheifComplaints;
    data['ConfrontationRight'] = this.confrontationRight;
    data['ConfrontationLeft'] = this.confrontationLeft;
    data['AmslerRight'] = this.amslerRight;
    data['AmslerLeft'] = this.amslerLeft;
    data['GRBS'] = this.gRBS;
    data['HCIRCUMFERENCE'] = this.hCIRCUMFERENCE;
    data['SPHRight'] = this.sPHRight;
    data['SPHLeft'] = this.sPHLeft;
    data['CYLRight'] = this.cYLRight;
    data['CYLLeft'] = this.cYLLeft;
    data['AXISRight'] = this.aXISRight;
    data['AXISLeft'] = this.aXISLeft;
    data['ADERight'] = this.aDERight;
    data['ADELeft'] = this.aDELeft;
    data['RegDate'] = this.regDate;
    data['Add1'] = this.add1;
    data['Add2'] = this.add2;
    data['Add3'] = this.add3;
    data['AadharNo'] = this.aadharNo;
    data['HealthCard'] = this.healthCard;
    data['Occupation'] = this.occupation;
    data['DoctorName'] = this.doctorName;
    data['ShiftName'] = this.shiftName;
    data['FromDate'] = this.fromDate;
    data['ToDate'] = this.toDate;
    data['IPNumber'] = this.iPNumber;
    data['IPYear'] = this.iPYear;
    data['SendSMS'] = this.sendSMS;
    data['SpecialFees'] = this.specialFees;
    data['BP'] = this.bP;
    data['Temperature'] = this.temperature;
    data['Sugar'] = this.sugar;
    data['BMI'] = this.bMI;
    data['ChestCircumference'] = this.chestCircumference;
    data['HeadCircumference'] = this.headCircumference;
    data['Abdominal'] = this.abdominal;
    data['Allergy'] = this.allergy;
    data['Cash'] = this.cash;
    data['Upi'] = this.upi;
    data['Card'] = this.card;
    return data;
  }
}
