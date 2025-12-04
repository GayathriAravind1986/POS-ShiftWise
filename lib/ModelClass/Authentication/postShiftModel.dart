import 'package:simple/Bloc/Response/errorResponse.dart';

/// success : true
/// message : "success"
/// data : {"_id":"692529b1cce96462c4696340","name":"Mathan","email":"mathan@gmail.com","role":"OPERATOR","locationId":"6890d1700eb176a5bfc48b2a","isWaiter":false,"active":true,"createdAt":"2025-11-25T03:59:45.891Z","__v":1,"shift":"2","shiftData":["hi","hello"]}

class PostShiftModel {
  PostShiftModel({
    bool? success,
    String? message,
    Data? data,
    ErrorResponse? errorResponse,
  }) {
    _success = success;
    _message = message;
    _data = data;
  }

  PostShiftModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    if (json['errors'] != null && json['errors'] is Map<String, dynamic>) {
      errorResponse = ErrorResponse.fromJson(json['errors']);
    } else {
      errorResponse = null;
    }
  }
  bool? _success;
  String? _message;
  Data? _data;
  ErrorResponse? errorResponse;
  PostShiftModel copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      PostShiftModel(
        success: success ?? _success,
        message: message ?? _message,
        data: data ?? _data,
      );
  bool? get success => _success;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    if (errorResponse != null) {
      map['errors'] = errorResponse!.toJson();
    }
    return map;
  }
}

/// _id : "692529b1cce96462c4696340"
/// name : "Mathan"
/// email : "mathan@gmail.com"
/// role : "OPERATOR"
/// locationId : "6890d1700eb176a5bfc48b2a"
/// isWaiter : false
/// active : true
/// createdAt : "2025-11-25T03:59:45.891Z"
/// __v : 1
/// shift : "2"
/// shiftData : ["hi","hello"]

class Data {
  Data({
    String? id,
    String? name,
    String? email,
    String? role,
    String? locationId,
    bool? isWaiter,
    bool? active,
    String? createdAt,
    num? v,
    String? shift,
    List<String>? shiftData,
  }) {
    _id = id;
    _name = name;
    _email = email;
    _role = role;
    _locationId = locationId;
    _isWaiter = isWaiter;
    _active = active;
    _createdAt = createdAt;
    _v = v;
    _shift = shift;
    _shiftData = shiftData;
  }

  Data.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _email = json['email'];
    _role = json['role'];
    _locationId = json['locationId'];
    _isWaiter = json['isWaiter'];
    _active = json['active'];
    _createdAt = json['createdAt'];
    _v = json['__v'];
    _shift = json['shift'];
    _shiftData =
        json['shiftData'] != null ? json['shiftData'].cast<String>() : [];
  }
  String? _id;
  String? _name;
  String? _email;
  String? _role;
  String? _locationId;
  bool? _isWaiter;
  bool? _active;
  String? _createdAt;
  num? _v;
  String? _shift;
  List<String>? _shiftData;
  Data copyWith({
    String? id,
    String? name,
    String? email,
    String? role,
    String? locationId,
    bool? isWaiter,
    bool? active,
    String? createdAt,
    num? v,
    String? shift,
    List<String>? shiftData,
  }) =>
      Data(
        id: id ?? _id,
        name: name ?? _name,
        email: email ?? _email,
        role: role ?? _role,
        locationId: locationId ?? _locationId,
        isWaiter: isWaiter ?? _isWaiter,
        active: active ?? _active,
        createdAt: createdAt ?? _createdAt,
        v: v ?? _v,
        shift: shift ?? _shift,
        shiftData: shiftData ?? _shiftData,
      );
  String? get id => _id;
  String? get name => _name;
  String? get email => _email;
  String? get role => _role;
  String? get locationId => _locationId;
  bool? get isWaiter => _isWaiter;
  bool? get active => _active;
  String? get createdAt => _createdAt;
  num? get v => _v;
  String? get shift => _shift;
  List<String>? get shiftData => _shiftData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['role'] = _role;
    map['locationId'] = _locationId;
    map['isWaiter'] = _isWaiter;
    map['active'] = _active;
    map['createdAt'] = _createdAt;
    map['__v'] = _v;
    map['shift'] = _shift;
    map['shiftData'] = _shiftData;
    return map;
  }
}
