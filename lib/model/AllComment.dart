class AllComment {
  int? statusCode;
  bool? isSuccess;
  Data? data;
  String? message;

  AllComment({this.statusCode, this.isSuccess, this.data, this.message});

  AllComment.fromJson(Map<String, dynamic> json) {
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
      data['data'] = this.data!.toJson();
    }
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
  List<Comments>? comments;

  Data(
      {this.id,
        this.descripation,
        this.address,
        this.createdAt,
        this.photo,
        this.phoneNumber,
        this.actor,
        this.comments});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descripation = json['descripation'];
    address = json['address'];
    createdAt = json['createdAt'];
    photo = json['photo'];
    phoneNumber = json['phoneNumber'];
    actor = json['actor'] != null ? new Actor.fromJson(json['actor']) : null;
    if (json['comments'] != null) {
      comments =<Comments>[];
      json['comments'].forEach((v) {
        comments!.add(new Comments.fromJson(v));
      });
    }
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
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
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

class Comments {
  String? content;
  String? createdAt;
  bool? isUpdated;
  Actor? actor;

  Comments({this.content, this.createdAt, this.isUpdated, this.actor});

  Comments.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    createdAt = json['createdAt'];
    isUpdated = json['isUpdated'];
    actor = json['actor'] != null ? new Actor.fromJson(json['actor']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this.content;
    data['createdAt'] = this.createdAt;
    data['isUpdated'] = this.isUpdated;
    if (this.actor != null) {
      data['actor'] = this.actor!.toJson();
    }
    return data;
  }
}
