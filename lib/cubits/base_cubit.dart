// this is the base cubit

abstract class CubitState {}

class DataLoading extends CubitState {}

class DataLoaded extends CubitState {
  DataLoaded(this.customModel);

  dynamic customModel;
}

class Error extends CubitState {
  Error({this.response});

  dynamic response;
}