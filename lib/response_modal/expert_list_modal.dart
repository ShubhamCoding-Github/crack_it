class ExpertListResponse {
  bool? success;
  int? status;
  List<ExpertData>? data;
  String? message;

  ExpertListResponse({this.success, this.status, this.data, this.message});

  ExpertListResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    if (json['data'] != null) {
      data = <ExpertData>[];
      json['data'].forEach((v) {
        data!.add(new ExpertData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class ExpertData {
  String? sId;
  User? user;
  String? description;
  int? price;
  List<String>? languages;
  JobCategory? jobCategory;
  int? experience;
  List<Expertise>? expertise;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? iV;
  int? rating;

  ExpertData(
      {this.sId,
        this.user,
        this.description,
        this.price,
        this.languages,
        this.jobCategory,
        this.experience,
        this.expertise,
        this.isDeleted,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.rating});

  ExpertData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    description = json['description'];
    price = json['price'];
    languages = json['languages'].cast<String>();
    jobCategory = json['jobCategory'] != null
        ? new JobCategory.fromJson(json['jobCategory'])
        : null;
    experience = json['experience'];
    if (json['expertise'] != null) {
      expertise = <Expertise>[];
      json['expertise'].forEach((v) {
        expertise!.add(new Expertise.fromJson(v));
      });
    }
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['description'] = this.description;
    data['price'] = this.price;
    data['languages'] = this.languages;
    if (this.jobCategory != null) {
      data['jobCategory'] = this.jobCategory!.toJson();
    }
    data['experience'] = this.experience;
    if (this.expertise != null) {
      data['expertise'] = this.expertise!.map((v) => v.toJson()).toList();
    }
    data['isDeleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['rating'] = this.rating;
    return data;
  }
}

class User {
  String? sId;
  String? firstName;
  String? lastName;
  int? phone;
  String? countryCode;
  String? email;

  User(
      {this.sId,
        this.firstName,
        this.lastName,
        this.phone,
        this.countryCode,
        this.email});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phone = json['phone'];
    countryCode = json['countryCode'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['phone'] = this.phone;
    data['countryCode'] = this.countryCode;
    data['email'] = this.email;
    return data;
  }
}

class JobCategory {
  String? sId;
  String? title;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? iV;

  JobCategory(
      {this.sId,
        this.title,
        this.isDeleted,
        this.createdAt,
        this.updatedAt,
        this.iV});

  JobCategory.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['isDeleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Expertise {
  String? sId;
  String? title;
  String? parent;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Expertise(
      {this.sId,
        this.title,
        this.parent,
        this.isDeleted,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Expertise.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    parent = json['parent'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['parent'] = this.parent;
    data['isDeleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
