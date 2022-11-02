import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stocks_assessment/api/repository.dart';
import 'package:flutter_stocks_assessment/cubits/base_cubit.dart';

class StocksDetailCubit extends Cubit<CubitState> {
  StocksDetailCubit() : super(DataLoading());
  DataRepository dataRepository = DataRepository();

  Future<void> fetchStocksForSymbol(String symbol) async {
    // try {
    //   emit(DataLoading());
    //   var data = await dataRepository.fetchStocksForSymbol(symbol);
    //   if (!isClosed) emit(DataLoaded(data));
    // } catch (e) {
    //   if (kDebugMode) {
    //     print(e);
    //   }
    //   emit(Error(response: e.toString()));
    // }
  }
}
