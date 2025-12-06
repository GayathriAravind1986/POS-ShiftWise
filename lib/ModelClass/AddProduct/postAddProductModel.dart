import 'package:simple/Bloc/Response/errorResponse.dart';

/// success : true
/// data : {"name":"veg biriyani","category":"69326a06bbcaf6bf506f63bc","basePrice":70,"parcelPrice":70,"acPrice":75,"hdPrice":75,"swiggyPrice":75,"hasAddons":false,"image":"https://res.cloudinary.com/dm6wrm7vf/image/upload/v1765018629/products/e5wkmudmhfkengulvgda.png","isStock":false,"dailyStockClear":false,"sortOrder":0,"isDefault":true,"locationId":"6890d1700eb176a5bfc48b2a","shift":"hi","shortCode":"2345","createdBy":"692529b1cce96462c4696340","_id":"69340c4d5e5b383b3309e887","createdAt":"2025-12-06T10:58:21.995Z","updatedAt":"2025-12-06T10:58:21.995Z","__v":0}

class PostAddProductModel {
  PostAddProductModel({
    bool? success,
    Data? data,
    ErrorResponse? errorResponse,
  }) {
    _success = success;
    _data = data;
  }

  PostAddProductModel.fromJson(dynamic json) {
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
  PostAddProductModel copyWith({
    bool? success,
    Data? data,
  }) =>
      PostAddProductModel(
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

/// name : "veg biriyani"
/// category : "69326a06bbcaf6bf506f63bc"
/// basePrice : 70
/// parcelPrice : 70
/// acPrice : 75
/// hdPrice : 75
/// swiggyPrice : 75
/// hasAddons : false
/// image : "https://res.cloudinary.com/dm6wrm7vf/image/upload/v1765018629/products/e5wkmudmhfkengulvgda.png"
/// isStock : false
/// dailyStockClear : false
/// sortOrder : 0
/// isDefault : true
/// locationId : "6890d1700eb176a5bfc48b2a"
/// shift : "hi"
/// shortCode : "2345"
/// createdBy : "692529b1cce96462c4696340"
/// _id : "69340c4d5e5b383b3309e887"
/// createdAt : "2025-12-06T10:58:21.995Z"
/// updatedAt : "2025-12-06T10:58:21.995Z"
/// __v : 0

class Data {
  Data({
    String? name,
    String? category,
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
    String? locationId,
    String? shift,
    String? shortCode,
    String? createdBy,
    String? id,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) {
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
    _id = id;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
  }

  Data.fromJson(dynamic json) {
    _name = json['name'];
    _category = json['category'];
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
    _locationId = json['locationId'];
    _shift = json['shift'];
    _shortCode = json['shortCode'];
    _createdBy = json['createdBy'];
    _id = json['_id'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _name;
  String? _category;
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
  String? _locationId;
  String? _shift;
  String? _shortCode;
  String? _createdBy;
  String? _id;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
  Data copyWith({
    String? name,
    String? category,
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
    String? locationId,
    String? shift,
    String? shortCode,
    String? createdBy,
    String? id,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) =>
      Data(
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
        id: id ?? _id,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        v: v ?? _v,
      );
  String? get name => _name;
  String? get category => _category;
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
  String? get locationId => _locationId;
  String? get shift => _shift;
  String? get shortCode => _shortCode;
  String? get createdBy => _createdBy;
  String? get id => _id;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['category'] = _category;
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
    map['locationId'] = _locationId;
    map['shift'] = _shift;
    map['shortCode'] = _shortCode;
    map['createdBy'] = _createdBy;
    map['_id'] = _id;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }
}
