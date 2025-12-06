import 'package:simple/Bloc/Response/errorResponse.dart';

/// success : true
/// data : [{"_id":"69281d5d78945d5fc1c3459c","name":"Chicken","category":{"_id":"6925478dcce96462c4697001","name":"Pop chicken"},"basePrice":19780,"parcelPrice":19780,"acPrice":100,"hdPrice":100,"swiggyPrice":100,"hasAddons":false,"isStock":true,"dailyStockClear":false,"isDefault":true,"locationId":{"_id":"6890d1700eb176a5bfc48b2a","name":"Tenkasi"},"shortCode":"22333","createdBy":{"_id":"6878971f0bc550868fe1b34b","name":"Saranya"},"createdAt":"2025-11-27T09:43:57.557Z","updatedAt":"2025-12-04T10:38:04.389Z"},{"_id":"692975dbca22636e04cf83e1","name":"Card","category":{"_id":"69254773cce96462c4696ff1","name":"Demo"},"basePrice":315,"parcelPrice":315,"acPrice":12,"hdPrice":12,"swiggyPrice":12,"hasAddons":false,"isStock":false,"dailyStockClear":false,"isDefault":true,"locationId":{"_id":"6890d1700eb176a5bfc48b2a","name":"Tenkasi"},"shortCode":"3445","createdBy":{"_id":"6878971f0bc550868fe1b34b","name":"Saranya"},"createdAt":"2025-11-28T10:13:47.733Z","updatedAt":"2025-11-28T10:16:27.189Z"},{"_id":"692975ffca22636e04cf83fa","name":"HD","category":{"_id":"6925478dcce96462c4697001","name":"Pop chicken"},"basePrice":1220,"parcelPrice":12,"acPrice":12,"hdPrice":1220,"swiggyPrice":12,"hasAddons":false,"isStock":false,"dailyStockClear":false,"isDefault":true,"locationId":{"_id":"6890d1700eb176a5bfc48b2a","name":"Tenkasi"},"shortCode":"766765","createdBy":{"_id":"6878971f0bc550868fe1b34b","name":"Saranya"},"createdAt":"2025-11-28T10:14:23.990Z","updatedAt":"2025-11-28T10:14:55.634Z"},{"_id":"69297859ca22636e04cf8bb1","name":"Cash","category":{"_id":"69254773cce96462c4696ff1","name":"Demo"},"basePrice":50445,"parcelPrice":50445,"acPrice":242,"hdPrice":42,"swiggyPrice":2353,"hasAddons":false,"isStock":false,"dailyStockClear":false,"isDefault":true,"locationId":{"_id":"6890d1700eb176a5bfc48b2a","name":"Tenkasi"},"shortCode":"745745","createdBy":{"_id":"6878971f0bc550868fe1b34b","name":"Saranya"},"createdAt":"2025-11-28T10:24:25.058Z","updatedAt":"2025-11-28T10:24:25.059Z"},{"_id":"69326b08bbcaf6bf506f6a70","name":"As","category":{"_id":"69326a06bbcaf6bf506f63bc","name":"Briyanii"},"basePrice":100,"parcelPrice":100,"acPrice":100,"hdPrice":100,"swiggyPrice":100,"hasAddons":true,"image":"https://res.cloudinary.com/dm6wrm7vf/image/upload/v1764911879/products/bit0cabx3ckgav4unthj.webp","isStock":true,"dailyStockClear":true,"isDefault":true,"locationId":{"_id":"6890d1700eb176a5bfc48b2a","name":"Tenkasi"},"shortCode":"46345","createdBy":{"_id":"692529b1cce96462c4696340","name":"Mathan"},"createdAt":"2025-12-05T05:18:00.981Z","updatedAt":"2025-12-05T06:53:06.103Z"},{"_id":"693278e6296aca5e5fe480f8","name":"Veg","category":{"_id":"693274de66e3690c1607e145","name":"Rice"},"basePrice":200,"parcelPrice":200,"acPrice":200,"hdPrice":200,"swiggyPrice":200,"hasAddons":true,"image":"https://res.cloudinary.com/dm6wrm7vf/image/upload/v1764915359/products/hjnewww7vpnug4wlhfok.png","isStock":true,"dailyStockClear":true,"isDefault":true,"locationId":{"_id":"6890d1700eb176a5bfc48b2a","name":"Tenkasi"},"shortCode":"654","createdBy":{"_id":"692529b1cce96462c4696340","name":"Mathan"},"createdAt":"2025-12-05T06:17:10.867Z","updatedAt":"2025-12-05T06:17:10.867Z"},{"_id":"69328107d36f786a558c9516","name":"AsSD","category":{"_id":"69326a06bbcaf6bf506f63bc","name":"Briyanii"},"basePrice":100,"parcelPrice":100,"acPrice":100,"hdPrice":100,"swiggyPrice":100,"hasAddons":false,"isStock":false,"dailyStockClear":false,"isDefault":true,"locationId":{"_id":"6890d1700eb176a5bfc48b2a","name":"Tenkasi"},"shortCode":"463459","createdBy":{"_id":"692529b1cce96462c4696340","name":"Mathan"},"createdAt":"2025-12-05T06:51:51.522Z","updatedAt":"2025-12-05T06:51:51.522Z"},{"_id":"6933cb09ae0472e290b9eaad","name":"datesNuts","category":{"_id":"693321a8ca811fa786f05d80","name":"Nuts"},"basePrice":80,"parcelPrice":90,"acPrice":90,"hdPrice":90,"swiggyPrice":90,"hasAddons":false,"isStock":false,"dailyStockClear":false,"isDefault":true,"locationId":{"_id":"6890d1700eb176a5bfc48b2a","name":"Tenkasi"},"shortCode":"456","createdBy":{"_id":"692529b1cce96462c4696340","name":"Mathan"},"createdAt":"2025-12-06T06:19:53.997Z","updatedAt":"2025-12-06T06:19:53.997Z"}]
/// totalCount : 8

class GetAddProductListModel {
  GetAddProductListModel({
    bool? success,
    List<Data>? data,
    num? totalCount,
    ErrorResponse? errorResponse,
  }) {
    _success = success;
    _data = data;
    _totalCount = totalCount;
  }

  GetAddProductListModel.fromJson(dynamic json) {
    _success = json['success'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _totalCount = json['totalCount'];
    if (json['errors'] != null && json['errors'] is Map<String, dynamic>) {
      errorResponse = ErrorResponse.fromJson(json['errors']);
    } else {
      errorResponse = null;
    }
  }
  bool? _success;
  List<Data>? _data;
  num? _totalCount;
  ErrorResponse? errorResponse;
  GetAddProductListModel copyWith({
    bool? success,
    List<Data>? data,
    num? totalCount,
  }) =>
      GetAddProductListModel(
        success: success ?? _success,
        data: data ?? _data,
        totalCount: totalCount ?? _totalCount,
      );
  bool? get success => _success;
  List<Data>? get data => _data;
  num? get totalCount => _totalCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['totalCount'] = _totalCount;
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
/// isDefault : true
/// locationId : {"_id":"6890d1700eb176a5bfc48b2a","name":"Tenkasi"}
/// shortCode : "22333"
/// createdBy : {"_id":"6878971f0bc550868fe1b34b","name":"Saranya"}
/// createdAt : "2025-11-27T09:43:57.557Z"
/// updatedAt : "2025-12-04T10:38:04.389Z"

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
    bool? isDefault,
    LocationId? locationId,
    String? shortCode,
    CreatedBy? createdBy,
    String? createdAt,
    String? updatedAt,
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
    _isDefault = isDefault;
    _locationId = locationId;
    _shortCode = shortCode;
    _createdBy = createdBy;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
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
    _isDefault = json['isDefault'];
    _locationId = json['locationId'] != null
        ? LocationId.fromJson(json['locationId'])
        : null;
    _shortCode = json['shortCode'];
    _createdBy = json['createdBy'] != null
        ? CreatedBy.fromJson(json['createdBy'])
        : null;
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
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
  bool? _isDefault;
  LocationId? _locationId;
  String? _shortCode;
  CreatedBy? _createdBy;
  String? _createdAt;
  String? _updatedAt;
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
    bool? isDefault,
    LocationId? locationId,
    String? shortCode,
    CreatedBy? createdBy,
    String? createdAt,
    String? updatedAt,
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
        isDefault: isDefault ?? _isDefault,
        locationId: locationId ?? _locationId,
        shortCode: shortCode ?? _shortCode,
        createdBy: createdBy ?? _createdBy,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
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
  bool? get isDefault => _isDefault;
  LocationId? get locationId => _locationId;
  String? get shortCode => _shortCode;
  CreatedBy? get createdBy => _createdBy;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

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
    map['isDefault'] = _isDefault;
    if (_locationId != null) {
      map['locationId'] = _locationId?.toJson();
    }
    map['shortCode'] = _shortCode;
    if (_createdBy != null) {
      map['createdBy'] = _createdBy?.toJson();
    }
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
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
