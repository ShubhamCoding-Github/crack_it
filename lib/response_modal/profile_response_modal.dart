class ProfileDetails {
  bool? success;
  int? status;
  ProfileData? data;
  String? message;

  ProfileDetails({this.success, this.status, this.data, this.message});

  ProfileDetails.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    data = json['data'] != null ? new ProfileData.fromJson(json['data']) : null;
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

class ProfileData {
  String? sId;
  String? firstName;
  String? lastName;
  int? phone;
  String? countryCode;
  String? role;
  String? email;

  ProfileData(
      {this.sId,
        this.firstName,
        this.lastName,
        this.phone,
        this.countryCode,
        this.role,
        this.email});

  ProfileData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phone = json['phone'];
    countryCode = json['countryCode'];
    role = json['role'];
    email = json['email'];
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
    return data;
  }
}
