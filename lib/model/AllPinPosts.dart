class AllPinPosts {
  List<Data>? data;
  int? currentPage;
  int? totalPages;
  int? totalCount;
  int? pageSize;
  bool? hasPreviousPage;
  bool? hasNextPage;
  int? statusCode;
  bool? isSuccess;
  Null message;

  AllPinPosts(
      {this.data,
        this.currentPage,
        this.totalPages,
        this.totalCount,
        this.pageSize,
        this.hasPreviousPage,
        this.hasNextPage,
        this.statusCode,
        this.isSuccess,
        this.message});

  AllPinPosts.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data?.add(new Data.fromJson(v));
      });
    }
    currentPage = json['currentPage'];
    totalPages = json['totalPages'];
    totalCount = json['totalCount'];
    pageSize = json['pageSize'];
    hasPreviousPage = json['hasPreviousPage'];
    hasNextPage = json['hasNextPage'];
    statusCode = json['statusCode'];
    isSuccess = json['isSuccess'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    data['currentPage'] = this.currentPage;
    data['totalPages'] = this.totalPages;
    data['totalCount'] = this.totalCount;
    data['pageSize'] = this.pageSize;
    data['hasPreviousPage'] = this.hasPreviousPage;
    data['hasNextPage'] = this.hasNextPage;
    data['statusCode'] = this.statusCode;
    data['isSuccess'] = this.isSuccess;
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  String? descripation;
  String? address;
  String? createdAt;
  String? photo;
  String? phoneNumber;
  Actor? actor;

  Data(
      {this.id,
        this.descripation,
        this.address,
        this.createdAt,
        this.photo,
        this.phoneNumber,
        this.actor});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descripation = json['descripation'];
    address = json['address'];
    createdAt = json['createdAt'];
    photo = json['photo'];
    phoneNumber = json['phoneNumber'];
    actor = json['actor'] != null ? new Actor.fromJson(json['actor']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['descripation'] = this.descripation;
    data['address'] = this.address;
    data['createdAt'] = this.createdAt;
    data['photo'] = this.photo;
    data['phoneNumber'] = this.phoneNumber;
    if (this.actor != null) {
      data['actor'] = this.actor!.toJson();
    }
    return data;
  }
}

class Actor {
  String? id;
  String? name;
  String? photo;

  Actor({this.id, this.name, this.photo});

  Actor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['photo'] = this.photo;
    return data;
  }
}
