import 'package:simple/Bloc/Response/errorResponse.dart';

/// success : true
/// data : {"_id":"69281d5d78945d5fc1c3459c","name":"Chicken","category":{"_id":"6925478dcce96462c4697001","name":"Pop chicken"},"basePrice":19780,"parcelPrice":19780,"acPrice":100,"hdPrice":100,"swiggyPrice":100,"hasAddons":false,"isStock":true,"dailyStockClear":false,"sortOrder":0,"isDefault":true,"locationId":{"_id":"6890d1700eb176a5bfc48b2a","name":"Tenkasi"},"shortCode":"22333","createdBy":{"_id":"6878971f0bc550868fe1b34b","name":"Saranya"},"createdAt":"2025-11-27T09:43:57.557Z","updatedAt":"2025-12-04T10:38:04.389Z","__v":0,"shift":"ADMIN"}

class GetSingleAddProductModel {
  GetSingleAddProductModel({
    bool? success,
    Data? data,
    ErrorResponse? errorResponse,
  }) {
    _success = success;
    _data = data;
  }

  GetSingleAddProductModel.fromJson(dynamic json) {
    _success = json['success'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    if (json['errors'] != null && json['errors'] is Map<String, dynamic>) {
      errorResponse = ErrorResponse.fromJson(json['errors']);
    } else {
      errorResponse = null;
    }
  }
  bool? _success;
  Data? _data;
  ErrorResponse? errorResponse;
  GetSingleAddProductModel copyWith({
    bool? success,
    Data? data,
  }) =>
      GetSingleAddProductModel(
        success: success ?? _success,
        data: data ?? _data,
      );
  bool? get success => _success;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    if (errorResponse != null) {
      map['errors'] = errorResponse!.toJson();
    }
    return map;
  }
}

/// _id : "69281d5d78945d5fc1c3459c"
/// name : "Chicken"
/// category : {"_id":"6925478dcce96462c4697001","name":"Pop chicken"}
/// basePrice : 19780
/// parcelPrice : 19780
/// acPrice : 100
/// hdPrice : 100
/// swiggyPrice : 100
/// hasAddons : false
/// isStock : true
/// dailyStockClear : false
/// sortOrder : 0
/// isDefault : true
/// locationId : {"_id":"6890d1700eb176a5bfc48b2a","name":"Tenkasi"}
/// shortCode : "22333"
/// createdBy : {"_id":"6878971f0bc550868fe1b34b","name":"Saranya"}
/// createdAt : "2025-11-27T09:43:57.557Z"
/// updatedAt : "2025-12-04T10:38:04.389Z"
/// __v : 0
/// shift : "ADMIN"

class Data {
  Data({
    String? id,
    String? name,
    Category? category,
    num? basePrice,
    num? parcelPrice,
    num? acPrice,
    num? hdPrice,
    num? swiggyPrice,
    bool? hasAddons,
    String? image,
    bool? isStock,
    bool? dailyStockClear,
    num? sortOrder,
    bool? isDefault,
    LocationId? locationId,
    String? shift,
    String? shortCode,
    CreatedBy? createdBy,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) {
    _id = id;
    _name = name;
    _category = category;
    _basePrice = basePrice;
    _parcelPrice = parcelPrice;
    _acPrice = acPrice;
    _hdPrice = hdPrice;
    _swiggyPrice = swiggyPrice;
    _hasAddons = hasAddons;
    _image = image;
    _isStock = isStock;
    _dailyStockClear = dailyStockClear;
    _sortOrder = sortOrder;
    _isDefault = isDefault;
    _locationId = locationId;
    _shift = shift;
    _shortCode = shortCode;
    _createdBy = createdBy;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
  }

  Data.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    _basePrice = json['basePrice'];
    _parcelPrice = json['parcelPrice'];
    _acPrice = json['acPrice'];
    _hdPrice = json['hdPrice'];
    _swiggyPrice = json['swiggyPrice'];
    _hasAddons = json['hasAddons'];
    _image = json['image'];
    _isStock = json['isStock'];
    _dailyStockClear = json['dailyStockClear'];
    _sortOrder = json['sortOrder'];
    _isDefault = json['isDefault'];
    _locationId = json['locationId'] != null
        ? LocationId.fromJson(json['locationId'])
        : null;
    _shift = json['shift'];
    _shortCode = json['shortCode'];
    _createdBy = json['createdBy'] != null
        ? CreatedBy.fromJson(json['createdBy'])
        : null;
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _id;
  String? _name;
  Category? _category;
  num? _basePrice;
  num? _parcelPrice;
  num? _acPrice;
  num? _hdPrice;
  num? _swiggyPrice;
  bool? _hasAddons;
  String? _image;
  bool? _isStock;
  bool? _dailyStockClear;
  num? _sortOrder;
  bool? _isDefault;
  LocationId? _locationId;
  String? _shift;
  String? _shortCode;
  CreatedBy? _createdBy;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
  Data copyWith({
    String? id,
    String? name,
    Category? category,
    num? basePrice,
    num? parcelPrice,
    num? acPrice,
    num? hdPrice,
    num? swiggyPrice,
    bool? hasAddons,
    String? image,
    bool? isStock,
    bool? dailyStockClear,
    num? sortOrder,
    bool? isDefault,
    LocationId? locationId,
    String? shift,
    String? shortCode,
    CreatedBy? createdBy,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) =>
      Data(
        id: id ?? _id,
        name: name ?? _name,
        category: category ?? _category,
        basePrice: basePrice ?? _basePrice,
        parcelPrice: parcelPrice ?? _parcelPrice,
        acPrice: acPrice ?? _acPrice,
        hdPrice: hdPrice ?? _hdPrice,
        swiggyPrice: swiggyPrice ?? _swiggyPrice,
        hasAddons: hasAddons ?? _hasAddons,
        image: image ?? _image,
        isStock: isStock ?? _isStock,
        dailyStockClear: dailyStockClear ?? _dailyStockClear,
        sortOrder: sortOrder ?? _sortOrder,
        isDefault: isDefault ?? _isDefault,
        locationId: locationId ?? _locationId,
        shift: shift ?? _shift,
        shortCode: shortCode ?? _shortCode,
        createdBy: createdBy ?? _createdBy,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        v: v ?? _v,
      );
  String? get id => _id;
  String? get name => _name;
  Category? get category => _category;
  num? get basePrice => _basePrice;
  num? get parcelPrice => _parcelPrice;
  num? get acPrice => _acPrice;
  num? get hdPrice => _hdPrice;
  num? get swiggyPrice => _swiggyPrice;
  bool? get hasAddons => _hasAddons;
  String? get image => _image;
  bool? get isStock => _isStock;
  bool? get dailyStockClear => _dailyStockClear;
  num? get sortOrder => _sortOrder;
  bool? get isDefault => _isDefault;
  LocationId? get locationId => _locationId;
  String? get shift => _shift;
  String? get shortCode => _shortCode;
  CreatedBy? get createdBy => _createdBy;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    if (_category != null) {
      map['category'] = _category?.toJson();
    }
    map['basePrice'] = _basePrice;
    map['parcelPrice'] = _parcelPrice;
    map['acPrice'] = _acPrice;
    map['hdPrice'] = _hdPrice;
    map['swiggyPrice'] = _swiggyPrice;
    map['hasAddons'] = _hasAddons;
    map['image'] = _image;
    map['isStock'] = _isStock;
    map['dailyStockClear'] = _dailyStockClear;
    map['sortOrder'] = _sortOrder;
    map['isDefault'] = _isDefault;
    if (_locationId != null) {
      map['locationId'] = _locationId?.toJson();
    }
    map['shift'] = _shift;
    map['shortCode'] = _shortCode;
    if (_createdBy != null) {
      map['createdBy'] = _createdBy?.toJson();
    }
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }
}

/// _id : "6878971f0bc550868fe1b34b"
/// name : "Saranya"

class CreatedBy {
  CreatedBy({
    String? id,
    String? name,
  }) {
    _id = id;
    _name = name;
  }

  CreatedBy.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
  }
  String? _id;
  String? _name;
  CreatedBy copyWith({
    String? id,
    String? name,
  }) =>
      CreatedBy(
        id: id ?? _id,
        name: name ?? _name,
      );
  String? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    return map;
  }
}

/// _id : "6890d1700eb176a5bfc48b2a"
/// name : "Tenkasi"

class LocationId {
  LocationId({
    String? id,
    String? name,
  }) {
    _id = id;
    _name = name;
  }

  LocationId.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
  }
  String? _id;
  String? _name;
  LocationId copyWith({
    String? id,
    String? name,
  }) =>
      LocationId(
        id: id ?? _id,
        name: name ?? _name,
      );
  String? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    return map;
  }
}

/// _id : "6925478dcce96462c4697001"
/// name : "Pop chicken"

class Category {
  Category({
    String? id,
    String? name,
  }) {
    _id = id;
    _name = name;
  }

  Category.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
  }
  String? _id;
  String? _name;
  Category copyWith({
    String? id,
    String? name,
  }) =>
      Category(
        id: id ?? _id,
        name: name ?? _name,
      );
  String? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    return map;
  }
}
