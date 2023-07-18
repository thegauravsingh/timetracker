class GroceryItem {
  final String userName;
  final int weekNo;
  final int year;
  final int buId;
  final int taskId;
  final String taskDetails;
  final int taskTime;
  final int workingDays;
  final String createdBy;

  const GroceryItem({
    required this.userName,
    required this.weekNo,
    required this.year,
    required this.buId,
    required this.taskId,
    required this.taskDetails,
    required this.taskTime,
    required this.workingDays,
    required this.createdBy,
  });
}
