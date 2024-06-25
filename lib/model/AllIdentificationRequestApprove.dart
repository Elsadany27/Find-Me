class AllIdentificationApprove {
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

  AllIdentificationApprove(
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

  AllIdentificationApprove.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data =<Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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
      data['data'] = this.data!.map((v) => v.toJson()).toList();
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
  String? sentAt;
  String? descripation;
  String? photo;

  Data({this.id, this.sentAt, this.descripation, this.photo});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sentAt = json['sentAt'];
    descripation = json['descripation'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sentAt'] = this.sentAt;
    data['descripation'] = this.descripation;
    data['photo'] = this.photo;
    return data;
  }
}
