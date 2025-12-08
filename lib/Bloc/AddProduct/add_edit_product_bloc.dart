import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple/Api/apiProvider.dart';

abstract class ProductEvent {}

class StockInLocation extends ProductEvent {}

class AddCategoryForProduct extends ProductEvent {
  String locId;
  AddCategoryForProduct(this.locId);
}

class SaveProduct extends ProductEvent {
  String name;
  String shortCode;
  String basePrice;
  String parcelPrice;
  String acPrice;
  String hdPrice;
  String swiggyPrice;
  bool isDefault;
  bool hasAddons;
  String category;
  String locationId;
  bool dailyStockClear;
  bool isStock;
  String pickedImageName;
  final File? imageFile;
  final Uint8List? imageBytes;
  SaveProduct(
    this.name,
    this.shortCode,
    this.basePrice,
    this.parcelPrice,
    this.acPrice,
    this.hdPrice,
    this.swiggyPrice,
    this.isDefault,
    this.hasAddons,
    this.category,
    this.locationId,
    this.dailyStockClear,
    this.isStock,
    this.pickedImageName, {
    this.imageFile,
    this.imageBytes,
  });
}

class AddProduct extends ProductEvent {
  String search;
  String locId;
  bool? isDefault;
  int offset;
  int limit;
  String catId;
  AddProduct(this.search, this.locId, this.isDefault, this.offset, this.limit,
      this.catId);
}

class ProductById extends ProductEvent {
  String productId;
  ProductById(this.productId);
}

class UpdateProduct extends ProductEvent {
  String productId;
  String name;
  String shortCode;
  String basePrice;
  String parcelPrice;
  String acPrice;
  String hdPrice;
  String swiggyPrice;
  bool isDefault;
  bool hasAddons;
  String category;
  String locationId;
  bool dailyStockClear;
  bool isStock;
  String pickedImageName;
  final File? imageFile;
  final Uint8List? imageBytes;
  UpdateProduct(
      this.productId,
      this.name,
      this.shortCode,
      this.basePrice,
      this.parcelPrice,
      this.acPrice,
      this.hdPrice,
      this.swiggyPrice,
      this.isDefault,
      this.hasAddons,
      this.category,
      this.locationId,
      this.dailyStockClear,
      this.isStock,
      this.pickedImageName,
      {this.imageFile,
      this.imageBytes});
}

class DeleteProduct extends ProductEvent {
  String productId;
  DeleteProduct(this.productId);
}

class StockDetails extends ProductEvent {}

class ProductBloc extends Bloc<ProductEvent, dynamic> {
  ProductBloc() : super(dynamic) {
    on<StockInLocation>((event, emit) async {
      await ApiProvider().getLocationAPI().then((value) {
        emit(value);
      }).catchError((error) {
        emit(error);
      });
    });
    on<AddCategoryForProduct>((event, emit) async {
      await ApiProvider()
          .getCategoryForAddProductAPI(event.locId)
          .then((value) {
        emit(value);
      }).catchError((error) {
        emit(error);
      });
    });
    on<SaveProduct>((event, emit) async {
      await ApiProvider()
          .postAddProductAPI(
        event.name,
        event.shortCode,
        event.basePrice,
        event.parcelPrice,
        event.acPrice,
        event.hdPrice,
        event.swiggyPrice,
        event.isDefault,
        event.hasAddons,
        event.category,
        event.locationId,
        event.dailyStockClear,
        event.isStock,
        event.pickedImageName,
        imageFile: event.imageFile,
        imageBytes: event.imageBytes,
      )
          .then((value) {
        emit(value);
      }).catchError((error) {
        emit(error);
      });
    });
    on<AddProduct>((event, emit) async {
      await ApiProvider()
          .getAddProductListAPI(event.search, event.locId, event.isDefault,
              event.offset, event.limit, event.catId)
          .then((value) {
        emit(value);
      }).catchError((error) {
        emit(error);
      });
    });
    on<ProductById>((event, emit) async {
      await ApiProvider().getSingleAddProductAPI(event.productId).then((value) {
        emit(value);
      }).catchError((error) {
        emit(error);
      });
    });
    on<UpdateProduct>((event, emit) async {
      await ApiProvider()
          .putAddProductAPI(
              event.productId,
              event.name,
              event.shortCode,
              event.basePrice,
              event.parcelPrice,
              event.acPrice,
              event.hdPrice,
              event.swiggyPrice,
              event.isDefault,
              event.hasAddons,
              event.category,
              event.locationId,
              event.dailyStockClear,
              event.isStock,
              event.pickedImageName,
              imageFile: event.imageFile,
              imageBytes: event.imageBytes)
          .then((value) {
        emit(value);
      }).catchError((error) {
        emit(error);
      });
    });
    on<DeleteProduct>((event, emit) async {
      await ApiProvider().deleteProductAPI(event.productId).then((value) {
        emit(value);
      }).catchError((error) {
        emit(error);
      });
    });
    on<StockDetails>((event, emit) async {
      await ApiProvider().getStockDetailsAPI().then((value) {
        emit(value);
      }).catchError((error) {
        emit(error);
      });
    });
  }
}
