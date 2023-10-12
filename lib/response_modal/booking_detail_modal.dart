class BookingDetailResponse {
  bool? success;
  int? status;
  SingleData? data;
  String? message;

  BookingDetailResponse({this.success, this.status, this.data, this.message});

  BookingDetailResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    data = json['data'] != null ? new SingleData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class SingleData {
  Booking? booking;
  ExpertProfile? expertProfile;

  SingleData({this.booking, this.expertProfile});

  SingleData.fromJson(Map<String, dynamic> json) {
    booking =
    json['booking'] != null ? new Booking.fromJson(json['booking']) : null;
    expertProfile = json['expertProfile'] != null
        ? new ExpertProfile.fromJson(json['expertProfile'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.booking != null) {
      data['booking'] = this.booking!.toJson();
    }
    if (this.expertProfile != null) {
      data['expertProfile'] = this.expertProfile!.toJson();
    }
    return data;
  }
}

class Booking {
  String? sId;
  InnerBooking? booking;
  int? totalAmount;
  int? commissionAmount;
  int? grandTotal;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Booking(
      {this.sId,
        this.booking,
        this.totalAmount,
        this.commissionAmount,
        this.grandTotal,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Booking.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    booking =
    json['booking'] != null ? new InnerBooking.fromJson(json['booking']) : null;
    totalAmount = json['totalAmount'];
    commissionAmount = json['CommissionAmount'];
    grandTotal = json['grandTotal'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.booking != null) {
      data['booking'] = this.booking!.toJson();
    }
    data['totalAmount'] = this.totalAmount;
    data['CommissionAmount'] = this.commissionAmount;
    data['grandTotal'] = this.grandTotal;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class InnerBooking {
  String? sId;
  User? user;
  User? expert;
  String? jobDescription;
  String? jobCategory;
  String? startTime;
  String? endTime;
  String? status;
  String? date;
  String? timeZone;
  List<String>? skills;
  int? duration;
  String? createdAt;
  String? updatedAt;

  InnerBooking(
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
        this.updatedAt});

  InnerBooking.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    expert = json['expert'] != null ? new User.fromJson(json['expert']) : null;
    jobDescription = json['jobDescription'];
    jobCategory = json['jobCategory'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    status = json['status'];
    date = json['date'];
    timeZone = json['timeZone'];
    skills = json['skills'].cast<String>();
    duration = json['duration'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
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
    data['jobCategory'] = this.jobCategory;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['status'] = this.status;
    data['date'] = this.date;
    data['timeZone'] = this.timeZone;
    data['skills'] = this.skills;
    data['duration'] = this.duration;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
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

class ExpertProfile {
  String? sId;
  String? user;
  String? description;
  int? price;
  List<String>? languages;
  JobCategory? jobCategory;
  int? experience;
  List<String>? expertise;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? iV;

  ExpertProfile(
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

  ExpertProfile.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    description = json['description'];
    price = json['price'];
    languages = json['languages'].cast<String>();
    jobCategory = json['jobCategory'] != null
        ? new JobCategory.fromJson(json['jobCategory'])
        : null;
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
    if (this.jobCategory != null) {
      data['jobCategory'] = this.jobCategory!.toJson();
    }
    data['experience'] = this.experience;
    data['expertise'] = this.expertise;
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
