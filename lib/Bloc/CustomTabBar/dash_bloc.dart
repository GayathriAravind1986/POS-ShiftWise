import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple/Api/apiProvider.dart';

abstract class DashEvent {}

class StockDashDetails extends DashEvent {}

class DashBloc extends Bloc<DashEvent, dynamic> {
  DashBloc() : super(dynamic) {
    on<StockDashDetails>((event, emit) async {
      await ApiProvider().getStockDetailsAPI().then((value) {
        emit(value);
      }).catchError((error) {
        emit(error);
      });
    });
  }
}
