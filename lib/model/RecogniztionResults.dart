class RecognizationResults {
  int? statusCode;
  bool? isSuccess;
  List<Data>? data;
  String? message;

  RecognizationResults(
      {this.statusCode, this.isSuccess, this.data, this.message});

  RecognizationResults.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    isSuccess = json['isSuccess'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['isSuccess'] = this.isSuccess;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? name;
  String? nationalId;
  String? maritalStatus;
  String? birthDate;
  String? job;
  String? photo;
  String? phoneNumber1;
  String? address;
  double? similarityPercent;
  String? phoneNumber2;
  String? notes;
  List<Data>? relatives;

  Data({
    this.name,
    this.nationalId,
    this.maritalStatus,
    this.birthDate,
    this.job,
    this.photo,
    this.phoneNumber1,
    this.address,
    this.similarityPercent,
    this.phoneNumber2,
    this.notes,
    this.relatives,
  });

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    nationalId = json['nationalId'];
    maritalStatus = json['maritalStatus'];
    birthDate = json['birthDate'];
    job = json['job'];
    photo = json['photo'];
    phoneNumber1 = json['phoneNumber1'];
    address = json['address'];
    similarityPercent = json['similarityPercent'];
    phoneNumber2 = json['phoneNumber2'];
    notes = json['notes'];
    if (json['relatives'] != null) {
      relatives = <Data>[];
      json['relatives'].forEach((v) {
        relatives!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['nationalId'] = nationalId;
    data['maritalStatus'] = maritalStatus;
    data['birthDate'] = birthDate;
    data['job'] = job;
    data['photo'] = photo;
    data['phoneNumber1'] = phoneNumber1;
    data['address'] = address;
    data['similarityPercent'] = similarityPercent;
    data['phoneNumber2'] = phoneNumber2;
    data['notes'] = notes;
    if (relatives != null) {
      data['relatives'] = relatives!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}