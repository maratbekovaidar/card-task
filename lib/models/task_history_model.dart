class TaskHistoryModel {
  String id;
  String storeName;
  String storeAddress;
  String userNumber;
  String note;
  String status;

  TaskHistoryModel(
      {
        required this.storeAddress,
        required this.id,
        required this.storeName,
        required this.userNumber,
        required this.note,
        required this.status
      }
  );

  factory TaskHistoryModel. fromJson(json) => TaskHistoryModel(
      id: json['id'],
      storeName: json['name'],
      storeAddress: json['adress'],
      userNumber: json['id'],
      note: json['number'],
      status: json['number']);
}
