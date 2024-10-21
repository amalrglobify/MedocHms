class RegistrationListModel {
  String? registerFolder;
  int? regSeries;
  int? revisitId;
  Null? fromDate;
  Null? toDate;
  int? regNo;
  String? pName;
  int? pGender;
  int? age;
  String? pDOB;
  int? doctor;
  String? healthCardNo;
  String? mobileNo;
  String? phoneNo;
  String? address1;
  String? address2;
  String? address3;
  String? adharNo;
  double? regFee;
  double? consultFee;
  double? otherFee;
  int? tokenNo;
  String? regDate;
  double? birthweight;
  double? currentweight;
  String? bloodgroup;
  double? height;
  String? fathersname;
  String? mothersname;
  String? fatherOccupation;
  String? motherOccupation;
  int? userId;
  int? deptId;
  int? delFlag;
  String? status;
  int? regId;
  String? district;
  String? state;
  String? religion;
  String? occupation;
  String? emailId;
  String? selectedImage;
  String? country;
  String? shift;
  String? oPDescription;
  int? mFlag;
  int? cash;
  int? upi;
  int? card;

  RegistrationListModel(
      {this.registerFolder,
        this.regSeries,
        this.revisitId,
        this.fromDate,
        this.toDate,
        this.regNo,
        this.pName,
        this.pGender,
        this.age,
        this.pDOB,
        this.doctor,
        this.healthCardNo,
        this.mobileNo,
        this.phoneNo,
        this.address1,
        this.address2,
        this.address3,
        this.adharNo,
        this.regFee,
        this.consultFee,
        this.otherFee,
        this.tokenNo,
        this.regDate,
        this.birthweight,
        this.currentweight,
        this.bloodgroup,
        this.height,
        this.fathersname,
        this.mothersname,
        this.fatherOccupation,
        this.motherOccupation,
        this.userId,
        this.deptId,
        this.delFlag,
        this.status,
        this.regId,
        this.district,
        this.state,
        this.religion,
        this.occupation,
        this.emailId,
        this.selectedImage,
        this.country,
        this.shift,
        this.oPDescription,
        this.mFlag,
        this.cash,
        this.upi,
        this.card});

  RegistrationListModel.fromJson(Map<String, dynamic> json) {
    registerFolder = json['RegisterFolder'];
    regSeries = json['RegSeries'];
    revisitId = json['Revisit_Id'];
    fromDate = json['FromDate'];
    toDate = json['ToDate'];
    regNo = json['RegNo'];
    pName = json['PName'];
    pGender = json['PGender'];
    age = json['Age'];
    pDOB = json['PDOB'];
    doctor = json['Doctor'];
    healthCardNo = json['HealthCardNo'];
    mobileNo = json['MobileNo'];
    phoneNo = json['PhoneNo'];
    address1 = json['Address1'];
    address2 = json['Address2'];
    address3 = json['Address3'];
    adharNo = json['AdharNo'];
    regFee = json['RegFee'];
    consultFee = json['ConsultFee'];
    otherFee = json['OtherFee'];
    tokenNo = json['TokenNo'];
    regDate = json['RegDate'];
    birthweight = json['Birthweight'];
    currentweight = json['Currentweight'];
    bloodgroup = json['Bloodgroup'];
    height = json['Height'];
    fathersname = json['Fathersname'];
    mothersname = json['Mothersname'];
    fatherOccupation = json['FatherOccupation'];
    motherOccupation = json['MotherOccupation'];
    userId = json['UserId'];
    deptId = json['DeptId'];
    delFlag = json['DelFlag'];
    status = json['Status'];
    regId = json['RegId'];
    district = json['District'];
    state = json['State'];
    religion = json['Religion'];
    occupation = json['Occupation'];
    emailId = json['EmailId'];
    selectedImage = json['selectedImage'];
    country = json['Country'];
    shift = json['Shift'];
    oPDescription = json['OPDescription'];
    mFlag = json['MFlag'];
    cash = json['Cash'];
    upi = json['Upi'];
    card = json['Card'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RegisterFolder'] = this.registerFolder;
    data['RegSeries'] = this.regSeries;
    data['Revisit_Id'] = this.revisitId;
    data['FromDate'] = this.fromDate;
    data['ToDate'] = this.toDate;
    data['RegNo'] = this.regNo;
    data['PName'] = this.pName;
    data['PGender'] = this.pGender;
    data['Age'] = this.age;
    data['PDOB'] = this.pDOB;
    data['Doctor'] = this.doctor;
    data['HealthCardNo'] = this.healthCardNo;
    data['MobileNo'] = this.mobileNo;
    data['PhoneNo'] = this.phoneNo;
    data['Address1'] = this.address1;
    data['Address2'] = this.address2;
    data['Address3'] = this.address3;
    data['AdharNo'] = this.adharNo;
    data['RegFee'] = this.regFee;
    data['ConsultFee'] = this.consultFee;
    data['OtherFee'] = this.otherFee;
    data['TokenNo'] = this.tokenNo;
    data['RegDate'] = this.regDate;
    data['Birthweight'] = this.birthweight;
    data['Currentweight'] = this.currentweight;
    data['Bloodgroup'] = this.bloodgroup;
    data['Height'] = this.height;
    data['Fathersname'] = this.fathersname;
    data['Mothersname'] = this.mothersname;
    data['FatherOccupation'] = this.fatherOccupation;
    data['MotherOccupation'] = this.motherOccupation;
    data['UserId'] = this.userId;
    data['DeptId'] = this.deptId;
    data['DelFlag'] = this.delFlag;
    data['Status'] = this.status;
    data['RegId'] = this.regId;
    data['District'] = this.district;
    data['State'] = this.state;
    data['Religion'] = this.religion;
    data['Occupation'] = this.occupation;
    data['EmailId'] = this.emailId;
    data['selectedImage'] = this.selectedImage;
    data['Country'] = this.country;
    data['Shift'] = this.shift;
    data['OPDescription'] = this.oPDescription;
    data['MFlag'] = this.mFlag;
    data['Cash'] = this.cash;
    data['Upi'] = this.upi;
    data['Card'] = this.card;
    return data;
  }
}
