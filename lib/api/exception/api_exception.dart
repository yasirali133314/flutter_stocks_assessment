class ApiException {
  int statusCode = -1;
  String message = '';

  ApiException({this.statusCode = -1, this.message = ''});
}
