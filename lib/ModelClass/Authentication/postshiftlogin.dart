/// success : true
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY5MjUyOWIxY2NlOTY0NjJjNDY5NjM0MCIsInJvbGUiOiJPUEVSQVRPUiIsImxvY2F0aW9uSWQiOiI2ODkwZDE3MDBlYjE3NmE1YmZjNDhiMmEiLCJpYXQiOjE3NjQ4MjQ1NTAsImV4cCI6MTc2NDkxMDk1MH0.IlXNCMmR0qwl1SA0BPb0jBAqxHAKIjaWyBtVPDPfHWI"
/// user : {"_id":"692529b1cce96462c4696340","name":"Mathan","email":"mathan@gmail.com","password":"$2b$10$ewmBcVxJAtpp6kblbVJoauvCQXt3fcs9prMOeG5HByfdp9Hd1OGF6","role":"OPERATOR","locationId":"6890d1700eb176a5bfc48b2a","isWaiter":false,"active":true,"createdAt":"2025-11-25T03:59:45.891Z","__v":1,"shift":"2","shiftData":["hi","hello"]}
/// message : "User logged in successfully"

class Postshiftlogin {
  Postshiftlogin({
    bool? success,
    String? token,
    User? user,
    String? message,
  }) {
    _success = success;
    _token = token;
    _user = user;
    _message = message;
  }

  Postshiftlogin.fromJson(dynamic json) {
    _success = json['success'];
    _token = json['token'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _message = json['message'];
  }
  bool? _success;
  String? _token;
  User? _user;
  String? _message;
  Postshiftlogin copyWith({
    bool? success,
    String? token,
    User? user,
    String? message,
  }) =>
      Postshiftlogin(
        success: success ?? _success,
        token: token ?? _token,
        user: user ?? _user,
        message: message ?? _message,
      );
  bool? get success => _success;
  String? get token => _token;
  User? get user => _user;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['token'] = _token;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['message'] = _message;
    return map;
  }
}

/// _id : "692529b1cce96462c4696340"
/// name : "Mathan"
/// email : "mathan@gmail.com"
/// password : "$2b$10$ewmBcVxJAtpp6kblbVJoauvCQXt3fcs9prMOeG5HByfdp9Hd1OGF6"
/// role : "OPERATOR"
/// locationId : "6890d1700eb176a5bfc48b2a"
/// isWaiter : false
/// active : true
/// createdAt : "2025-11-25T03:59:45.891Z"
/// __v : 1
/// shift : "2"
/// shiftData : ["hi","hello"]

class User {
  User({
    String? id,
    String? name,
    String? email,
    String? password,
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
    _password = password;
    _role = role;
    _locationId = locationId;
    _isWaiter = isWaiter;
    _active = active;
    _createdAt = createdAt;
    _v = v;
    _shift = shift;
    _shiftData = shiftData;
  }

  User.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _email = json['email'];
    _password = json['password'];
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
  String? _password;
  String? _role;
  String? _locationId;
  bool? _isWaiter;
  bool? _active;
  String? _createdAt;
  num? _v;
  String? _shift;
  List<String>? _shiftData;
  User copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? role,
    String? locationId,
    bool? isWaiter,
    bool? active,
    String? createdAt,
    num? v,
    String? shift,
    List<String>? shiftData,
  }) =>
      User(
        id: id ?? _id,
        name: name ?? _name,
        email: email ?? _email,
        password: password ?? _password,
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
  String? get password => _password;
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
    map['password'] = _password;
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
