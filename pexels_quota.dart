class Quota {
  static const int _requestsPerMonth = 20000;
  static const int _requestsPerHour = 200;
  int _remainingRequestsPerMonth = 20000;
  // int _remainingRequestsPerHour = 200;

  int get getRequestsPerMonth => _requestsPerMonth;
  int get getRequestsPerHour => _requestsPerHour;
  int get getReminaingRequestsPerMonth => _remainingRequestsPerMonth;
  // int get getRemainingRequestsPerHour => _remainingRequestsPerHour;

  Quota(
      {int remainingRequestsPerMonth = _requestsPerMonth,
      // int remainingRequestsPerHour = _requestsPerHour
      }) {
    this._remainingRequestsPerMonth = remainingRequestsPerMonth;
    // this._remainingRequestsPerHour = remainingRequestsPerHour;
  }

}