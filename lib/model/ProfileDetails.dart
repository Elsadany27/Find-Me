class ProfileDetailsModel {
  int? statusCode;
  bool? isSuccess;
  Data? data;
  String? message;

  ProfileDetailsModel(
      {this.statusCode, this.isSuccess, this.data, this.message});

  ProfileDetailsModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    isSuccess = json['isSuccess'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['isSuccess'] = this.isSuccess;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? name;
  String? email;
  String? phoneNumber;
  String? userName;
  String? gender;
  String? address;
  String? photo;

  Data(
      {this.name,
        this.email,
        this.phoneNumber,
        this.userName,
        this.gender,
        this.address,
        this.photo});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    userName = json['userName'];
    gender = json['gender'];
    address = json['address'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['userName'] = this.userName;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data['photo'] = this.photo;
    return data;
  }
}
