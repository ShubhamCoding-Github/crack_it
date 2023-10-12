class BookingListResponse {
  bool? success;
  int? status;
  List<BookingData>? data;
  Pagination? pagination;
  String? message;

  BookingListResponse(
      {this.success, this.status, this.data, this.pagination, this.message});

  BookingListResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    if (json['data'] != null) {
      data = <BookingData>[];
      json['data'].forEach((v) {
        data!.add(new BookingData.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class BookingData {
  String? sId;
  User? user;
  User? expert;
  String? jobDescription;
  JobCategory? jobCategory;
  String? startTime;
  String? endTime;
  String? status;
  String? date;
  String? timeZone;
  Skills? skills;
  int? duration;
  String? createdAt;
  String? updatedAt;
  int? iV;
  ExpertData? expertData;

  BookingData(
      {this.sId,
        this.user,
        this.expert,
        this.jobDescription,
        this.jobCategory,
        this.startTime,
        this.endTime,
        this.status,
        this.date,
        this.timeZone,
        this.skills,
        this.duration,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.expertData});

  BookingData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    expert = json['expert'] != null ? new User.fromJson(json['expert']) : null;
    jobDescription = json['jobDescription'];
    jobCategory = json['jobCategory'] != null
        ? new JobCategory.fromJson(json['jobCategory'])
        : null;
    startTime = json['startTime'];
    endTime = json['endTime'];
    status = json['status'];
    date = json['date'];
    timeZone = json['timeZone'];
    skills =
    json['skills'] != null ? new Skills.fromJson(json['skills']) : null;
    duration = json['duration'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    expertData = json['expertData'] != null
        ? new ExpertData.fromJson(json['expertData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.expert != null) {
      data['expert'] = this.expert!.toJson();
    }
    data['jobDescription'] = this.jobDescription;
    if (this.jobCategory != null) {
      data['jobCategory'] = this.jobCategory!.toJson();
    }
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['status'] = this.status;
    data['date'] = this.date;
    data['timeZone'] = this.timeZone;
    if (this.skills != null) {
      data['skills'] = this.skills!.toJson();
    }
    data['duration'] = this.duration;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.expertData != null) {
      data['expertData'] = this.expertData!.toJson();
    }
    return data;
  }
}

class User {
  String? sId;
  String? firstName;
  String? lastName;
  int? phone;
  String? countryCode;
  String? role;
  String? email;
  bool? isExpertProfileVerified;
  String? password;
  bool? isPhoneVerified;
  bool? isEmailVerified;
  bool? termAndConditions;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? iV;

  User(
      {this.sId,
        this.firstName,
        this.lastName,
        this.phone,
        this.countryCode,
        this.role,
        this.email,
        this.isExpertProfileVerified,
        this.password,
        this.isPhoneVerified,
        this.isEmailVerified,
        this.termAndConditions,
        this.isDeleted,
        this.createdAt,
        this.updatedAt,
        this.iV});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phone = json['phone'];
    countryCode = json['countryCode'];
    role = json['role'];
    email = json['email'];
    isExpertProfileVerified = json['isExpertProfileVerified'];
    password = json['password'];
    isPhoneVerified = json['isPhoneVerified'];
    isEmailVerified = json['isEmailVerified'];
    termAndConditions = json['termAndConditions'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['phone'] = this.phone;
    data['countryCode'] = this.countryCode;
    data['role'] = this.role;
    data['email'] = this.email;
    data['isExpertProfileVerified'] = this.isExpertProfileVerified;
    data['password'] = this.password;
    data['isPhoneVerified'] = this.isPhoneVerified;
    data['isEmailVerified'] = this.isEmailVerified;
    data['termAndConditions'] = this.termAndConditions;
    data['isDeleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
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

class Skills {
  String? sId;
  String? title;
  Parent? parent;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Skills(
      {this.sId,
        this.title,
        this.parent,
        this.isDeleted,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Skills.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    parent =
    json['parent'] != null ? new Parent.fromJson(json['parent']) : null;
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    if (this.parent != null) {
      data['parent'] = this.parent!.toJson();
    }
    data['isDeleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Parent {
  String? sId;
  String? title;
  String? parent;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Parent(
      {this.sId,
        this.title,
        this.parent,
        this.isDeleted,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Parent.fromJson(Map<String, dynamic> json) {
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

class ExpertData {
  String? sId;
  String? user;
  String? description;
  int? price;
  List<String>? languages;
  String? jobCategory;
  int? experience;
  List<String>? expertise;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? iV;

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
        this.iV});

  ExpertData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    description = json['description'];
    price = json['price'];
    languages = json['languages'].cast<String>();
    jobCategory = json['jobCategory'];
    experience = json['experience'];
    expertise = json['expertise'].cast<String>();
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user'] = this.user;
    data['description'] = this.description;
    data['price'] = this.price;
    data['languages'] = this.languages;
    data['jobCategory'] = this.jobCategory;
    data['experience'] = this.experience;
    data['expertise'] = this.expertise;
    data['isDeleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Pagination {
  int? totalCount;
  int? totalPages;
  int? currentPage;
  int? nextPage;
  int? prevPage;

  Pagination(
      {this.totalCount,
        this.totalPages,
        this.currentPage,
        this.nextPage,
        this.prevPage});

  Pagination.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    totalPages = json['totalPages'];
    currentPage = json['currentPage'];
    nextPage = json['nextPage'];
    prevPage = json['prevPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalCount'] = this.totalCount;
    data['totalPages'] = this.totalPages;
    data['currentPage'] = this.currentPage;
    data['nextPage'] = this.nextPage;
    data['prevPage'] = this.prevPage;
    return data;
  }
}
