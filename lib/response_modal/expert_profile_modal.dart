class ExpertProfileResponse {
  int? status;
  bool? success;
  ExpertProfileData? data;
  String? message;

  ExpertProfileResponse({this.status, this.success, this.data, this.message});

  ExpertProfileResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    data = json['data'] != null ? new ExpertProfileData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class ExpertProfileData {
  Expert? expert;
  int? rating;

  ExpertProfileData({this.expert, this.rating});

  ExpertProfileData.fromJson(Map<String, dynamic> json) {
    expert =
    json['expert'] != null ? new Expert.fromJson(json['expert']) : null;
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.expert != null) {
      data['expert'] = this.expert!.toJson();
    }
    data['rating'] = this.rating;
    return data;
  }
}

class Expert {
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

  Expert(
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
        this.iV});

  Expert.fromJson(Map<String, dynamic> json) {
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

  JobCategory({this.sId, this.title});

  JobCategory.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    return data;
  }
}

class Expertise {
  String? sId;
  String? title;

  Expertise(
      {this.sId,
        this.title});

  Expertise.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    return data;
  }
}
