class Quota {
  static const int _requestsPerMonth = 20000;
  static const int _requestsPerHour = 200;
  int _remainingRequestsPerMonth = 20000;

  int get getRequestsPerMonth => _requestsPerMonth;
  int get getRequestsPerHour => _requestsPerHour;
  int get getReminaingRequestsPerMonth => _remainingRequestsPerMonth;

  static Quota _singleton = null;
  Quota._internal({int remainingRequestsPerMonth = _requestsPerMonth}) {
    _remainingRequestsPerMonth = remainingRequestsPerMonth;
  }
  factory Quota({int remainingRequestsPerMonth = _requestsPerMonth}) {
    _singleton ??= new Quota._internal(
        remainingRequestsPerMonth: remainingRequestsPerMonth);
    _singleton._remainingRequestsPerMonth = remainingRequestsPerMonth;
    return _singleton;
  }

  @override
  String toString() =>
      'Requests Per Month: $_remainingRequestsPerMonth\\$_requestsPerMonth';
}
