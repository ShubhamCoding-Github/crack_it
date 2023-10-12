class PaymentsListResponse {
  bool? success;
  int? status;
  List<Payment>? data;
  Pagination? pagination;
  String? message;

  PaymentsListResponse(
      {this.success, this.status, this.data, this.pagination, this.message});

  PaymentsListResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    if (json['data'] != null) {
      data = <Payment>[];
      json['data'].forEach((v) {
        data!.add(new Payment.fromJson(v));
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

class Payment {
  String? sId;
  Booking? booking;
  int? totalAmount;
  int? commissionAmount;
  int? grandTotal;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Payment(
      {this.sId,
        this.booking,
        this.totalAmount,
        this.commissionAmount,
        this.grandTotal,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Payment.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    booking =
    json['booking'] != null ? new Booking.fromJson(json['booking']) : null;
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

class Booking {
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

  Booking(
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

  Booking.fromJson(Map<String, dynamic> json) {
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

  User({this.sId, this.firstName, this.lastName});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
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
