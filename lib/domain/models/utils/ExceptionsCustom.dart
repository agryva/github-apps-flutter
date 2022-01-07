class ExceptionsCustom implements Exception {
  final dynamic message;

  ExceptionsCustom([this.message]);

  String toString() {
    var message = this.message;
    if (message == null) return "Exception";
    return "$message";
  }
}