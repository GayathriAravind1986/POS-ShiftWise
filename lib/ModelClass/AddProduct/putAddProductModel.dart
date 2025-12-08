import 'package:simple/Bloc/Response/errorResponse.dart';

/// success : true
/// data : {"_id":"69341a8a5e5b383b3309ea31","name":"egg biriyani","category":"69326a06bbcaf6bf506f63bc","basePrice":60,"parcelPrice":70,"acPrice":70,"hdPrice":70,"swiggyPrice":70,"hasAddons":false,"isStock":false,"dailyStockClear":false,"sortOrder":0,"isDefault":true,"locationId":"6890d1700eb176a5bfc48b2a","shift":"hi","shortCode":"567","createdBy":"692529b1cce96462c4696340","createdAt":"2025-12-06T11:59:06.834Z","updatedAt":"2025-12-08T09:13:18.737Z","__v":0,"image":"https://res.cloudinary.com/dm6wrm7vf/image/upload/v1765185124/products/jtmxvfqmefe0yzngjhss.png"}

class PutAddProductModel {
  PutAddProductModel({
    bool? success,
    Data? data,
    ErrorResponse? errorResponse,
  }) {
    _success = success;
    _data = data;
  }

  PutAddProductModel.fromJson(dynamic json) {
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
  PutAddProductModel copyWith({
    bool? success,
    Data? data,
  }) =>
      PutAddProductModel(
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

/// _id : "69341a8a5e5b383b3309ea31"
/// name : "egg biriyani"
/// category : "69326a06bbcaf6bf506f63bc"
/// basePrice : 60
/// parcelPrice : 70
/// acPrice : 70
/// hdPrice : 70
/// swiggyPrice : 70
/// hasAddons : false
/// isStock : false
/// dailyStockClear : false
/// sortOrder : 0
/// isDefault : true
/// locationId : "6890d1700eb176a5bfc48b2a"
/// shift : "hi"
/// shortCode : "567"
/// createdBy : "692529b1cce96462c4696340"
/// createdAt : "2025-12-06T11:59:06.834Z"
/// updatedAt : "2025-12-08T09:13:18.737Z"
/// __v : 0
/// image : "https://res.cloudinary.com/dm6wrm7vf/image/upload/v1765185124/products/jtmxvfqmefe0yzngjhss.png"

class Data {
  Data({
    String? id,
    String? name,
    String? category,
    num? basePrice,
    num? parcelPrice,
    num? acPrice,
    num? hdPrice,
    num? swiggyPrice,
    bool? hasAddons,
    bool? isStock,
    bool? dailyStockClear,
    num? sortOrder,
    bool? isDefault,
    String? locationId,
    String? shift,
    String? shortCode,
    String? createdBy,
    String? createdAt,
    String? updatedAt,
    num? v,
    String? image,
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
    _image = image;
  }

  Data.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _category = json['category'];
    _basePrice = json['basePrice'];
    _parcelPrice = json['parcelPrice'];
    _acPrice = json['acPrice'];
    _hdPrice = json['hdPrice'];
    _swiggyPrice = json['swiggyPrice'];
    _hasAddons = json['hasAddons'];
    _isStock = json['isStock'];
    _dailyStockClear = json['dailyStockClear'];
    _sortOrder = json['sortOrder'];
    _isDefault = json['isDefault'];
    _locationId = json['locationId'];
    _shift = json['shift'];
    _shortCode = json['shortCode'];
    _createdBy = json['createdBy'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
    _image = json['image'];
  }
  String? _id;
  String? _name;
  String? _category;
  num? _basePrice;
  num? _parcelPrice;
  num? _acPrice;
  num? _hdPrice;
  num? _swiggyPrice;
  bool? _hasAddons;
  bool? _isStock;
  bool? _dailyStockClear;
  num? _sortOrder;
  bool? _isDefault;
  String? _locationId;
  String? _shift;
  String? _shortCode;
  String? _createdBy;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
  String? _image;
  Data copyWith({
    String? id,
    String? name,
    String? category,
    num? basePrice,
    num? parcelPrice,
    num? acPrice,
    num? hdPrice,
    num? swiggyPrice,
    bool? hasAddons,
    bool? isStock,
    bool? dailyStockClear,
    num? sortOrder,
    bool? isDefault,
    String? locationId,
    String? shift,
    String? shortCode,
    String? createdBy,
    String? createdAt,
    String? updatedAt,
    num? v,
    String? image,
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
        image: image ?? _image,
      );
  String? get id => _id;
  String? get name => _name;
  String? get category => _category;
  num? get basePrice => _basePrice;
  num? get parcelPrice => _parcelPrice;
  num? get acPrice => _acPrice;
  num? get hdPrice => _hdPrice;
  num? get swiggyPrice => _swiggyPrice;
  bool? get hasAddons => _hasAddons;
  bool? get isStock => _isStock;
  bool? get dailyStockClear => _dailyStockClear;
  num? get sortOrder => _sortOrder;
  bool? get isDefault => _isDefault;
  String? get locationId => _locationId;
  String? get shift => _shift;
  String? get shortCode => _shortCode;
  String? get createdBy => _createdBy;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    map['category'] = _category;
    map['basePrice'] = _basePrice;
    map['parcelPrice'] = _parcelPrice;
    map['acPrice'] = _acPrice;
    map['hdPrice'] = _hdPrice;
    map['swiggyPrice'] = _swiggyPrice;
    map['hasAddons'] = _hasAddons;
    map['isStock'] = _isStock;
    map['dailyStockClear'] = _dailyStockClear;
    map['sortOrder'] = _sortOrder;
    map['isDefault'] = _isDefault;
    map['locationId'] = _locationId;
    map['shift'] = _shift;
    map['shortCode'] = _shortCode;
    map['createdBy'] = _createdBy;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    map['image'] = _image;
    return map;
  }
}
