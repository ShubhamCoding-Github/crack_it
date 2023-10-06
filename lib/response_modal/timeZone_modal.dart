class TimeZoneResponse {
  bool? success;
  int? status;
  List<TimeZoneData>? data;
  String? message;

  TimeZoneResponse({this.success, this.status, this.data, this.message});

  TimeZoneResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    if (json['data'] != null) {
      data = <TimeZoneData>[];
      json['data'].forEach((v) {
        data!.add(new TimeZoneData.fromJson(v));
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

class TimeZoneData {
  String? sId;
  int? offsetMinutes;
  String? symbol;
  String? name;

  TimeZoneData({this.sId, this.offsetMinutes, this.symbol, this.name});

  TimeZoneData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    offsetMinutes = json['offsetMinutes'];
    symbol = json['symbol'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['offsetMinutes'] = this.offsetMinutes;
    data['symbol'] = this.symbol;
    data['name'] = this.name;
    return data;
  }
}
