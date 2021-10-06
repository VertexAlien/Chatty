class Subs {
  int months;
  DateTime startDate;
  DateTime endDate;
  String orderId;
  String userId;

  Subs({this.months, this.startDate, this.endDate, this.orderId, this.userId});

  Map<String, dynamic> toMap(Subs subs) {
    var subMap = <String, dynamic>{};
    subMap["months"] = subs.months;
    subMap["startDate"] = subs.startDate;
    subMap["endDate"] = subs.endDate;
    subMap["orderId"] = subs.orderId;
    subMap["userId"] = subs.userId;
    return subMap;
  }

  Subs.fromMap(Map<String, dynamic> subMap) {
    months = subMap["months"];
    startDate = subMap["startDate"];
    endDate = subMap["endDate"];
    orderId = subMap["orderId"];
    userId = subMap["userId"];
  }
}
