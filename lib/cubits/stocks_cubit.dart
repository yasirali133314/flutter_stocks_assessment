import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stocks_assessment/api/repository.dart';
import 'package:flutter_stocks_assessment/cubits/base_cubit.dart';
import 'package:flutter_stocks_assessment/widgets/snackbars.dart';
import 'package:intl/intl.dart';

class StocksCubit extends Cubit<CubitState> {
  StocksCubit() : super(DataLoading());
  DataRepository dataRepository = DataRepository();
  TextEditingController dateFromController = TextEditingController();
  TextEditingController dateToController = TextEditingController();

  var data;

  Future<void> fetchStocks({String? dateFrom, String? dateTo}) async {
    try {
      emit(DataLoading());
      if (dateFrom == null && dateTo == null) {
        dateFrom = dateFormat.format(currentDate);
        dateTo = dateFormat.format(currentDate);
        dateToController.text = dateTo;
        dateFromController.text = dateFrom;
      }
      data = await dataRepository.getStocks(dateFrom: dateFrom, dateTo: dateTo);
      if (!isClosed) emit(DataLoaded(data));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(Error(response: e.toString()));
    }
  }

  DateTime currentDate = DateTime.now();
  String selectedValue = '';
  var dateFormat = DateFormat('yyyy-MM-dd');

  Future<String?> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2010, 1),
        lastDate: DateTime(2030));
    if (picked != null && picked != currentDate) {
      currentDate = picked;
      selectedValue = dateFormat.format(currentDate);
    }
    return selectedValue;
  }

  void refreshUI() {
    emit(DataLoaded(data));
  }

  bool datesValid() {
    var dateTo = dateFormat.parse(dateToController.text);
    var dateFrom = dateFormat.parse(dateFromController.text);
    if (dateTo.isBefore(dateFrom)) {
      Snackbars.showError('Date to can\'t be before date from');
      return false;
    }
    return true;
  }
}
