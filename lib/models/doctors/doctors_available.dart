class DoctorsAvailable {
  List<DoctorsAvailableList>? doctorsAvailableList;
  bool? success;

  DoctorsAvailable({this.doctorsAvailableList, this.success});

  DoctorsAvailable.fromJson(Map<String, dynamic> json) {
    if (json['oList'] != null) {
      doctorsAvailableList = <DoctorsAvailableList>[];
      json['oList'].forEach((v) {
        doctorsAvailableList!.add(new DoctorsAvailableList.fromJson(v));
      });
    }
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.doctorsAvailableList != null) {
      data['oList'] = this.doctorsAvailableList!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    return data;
  }
}

class DoctorsAvailableList {
  Null? userName;
  int? doctorsId;
  int? doctorUserId;
  String? name;
  String? currentDate;
  Null? gender;
  Null? designation;
  Null? training;
  Null? acheivement;
  Null? certification;
  Null? qualification;
  Null? qualification1;
  Null? qualification2;
  Null? qualification3;
  Null? qualification4;
  Null? language;
  String? department;
  Null? address1;
  Null? address2;
  Null? address3;
  Null? phoneNumber;
  Null? mobileNumber;
  Null? email;
  String? selectedImage;
  int? active;
  int? consultancy;
  Null? experience;
  Null? specialization;
  int? deptId;
  int? delFlag;
  Null? statusdoc;

  DoctorsAvailableList(
      {this.userName,
        this.doctorsId,
        this.doctorUserId,
        this.name,
        this.currentDate,
        this.gender,
        this.designation,
        this.training,
        this.acheivement,
        this.certification,
        this.qualification,
        this.qualification1,
        this.qualification2,
        this.qualification3,
        this.qualification4,
        this.language,
        this.department,
        this.address1,
        this.address2,
        this.address3,
        this.phoneNumber,
        this.mobileNumber,
        this.email,
        this.selectedImage,
        this.active,
        this.consultancy,
        this.experience,
        this.specialization,
        this.deptId,
        this.delFlag,
        this.statusdoc});

  DoctorsAvailableList.fromJson(Map<String, dynamic> json) {
    userName = json['UserName'];
    doctorsId = json['DoctorsId'];
    doctorUserId = json['Doctor_UserId'];
    name = json['Name'];
    currentDate = json['CurrentDate'];
    gender = json['Gender'];
    designation = json['Designation'];
    training = json['Training'];
    acheivement = json['Acheivement'];
    certification = json['Certification'];
    qualification = json['Qualification'];
    qualification1 = json['Qualification1'];
    qualification2 = json['Qualification2'];
    qualification3 = json['Qualification3'];
    qualification4 = json['Qualification4'];
    language = json['Language'];
    department = json['Department'];
    address1 = json['Address1'];
    address2 = json['Address2'];
    address3 = json['Address3'];
    phoneNumber = json['PhoneNumber'];
    mobileNumber = json['MobileNumber'];
    email = json['Email'];
    selectedImage = json['selectedImage'];
    active = json['Active'];
    consultancy = json['Consultancy'];
    experience = json['Experience'];
    specialization = json['Specialization'];
    deptId = json['DeptId'];
    delFlag = json['DelFlag'];
    statusdoc = json['Statusdoc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserName'] = this.userName;
    data['DoctorsId'] = this.doctorsId;
    data['Doctor_UserId'] = this.doctorUserId;
    data['Name'] = this.name;
    data['CurrentDate'] = this.currentDate;
    data['Gender'] = this.gender;
    data['Designation'] = this.designation;
    data['Training'] = this.training;
    data['Acheivement'] = this.acheivement;
    data['Certification'] = this.certification;
    data['Qualification'] = this.qualification;
    data['Qualification1'] = this.qualification1;
    data['Qualification2'] = this.qualification2;
    data['Qualification3'] = this.qualification3;
    data['Qualification4'] = this.qualification4;
    data['Language'] = this.language;
    data['Department'] = this.department;
    data['Address1'] = this.address1;
    data['Address2'] = this.address2;
    data['Address3'] = this.address3;
    data['PhoneNumber'] = this.phoneNumber;
    data['MobileNumber'] = this.mobileNumber;
    data['Email'] = this.email;
    data['selectedImage'] = this.selectedImage;
    data['Active'] = this.active;
    data['Consultancy'] = this.consultancy;
    data['Experience'] = this.experience;
    data['Specialization'] = this.specialization;
    data['DeptId'] = this.deptId;
    data['DelFlag'] = this.delFlag;
    data['Statusdoc'] = this.statusdoc;
    return data;
  }
}
