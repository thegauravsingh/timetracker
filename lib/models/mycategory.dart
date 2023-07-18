enum Categories {
  development,
  enhancement,
  support,
  planning,
  othertasks,
}

class MyCategory {
  //final String title;
  //final Color color;

  final int id;
  final int buId;
  final int taskId;
  final String buName;
  final String taskType;
  final String createdBy;
  final String createdAt;
  final String updatedBy;
  final String updatedAt;
//  const MyCategory(this.title, this.color);

  const MyCategory(this.id, this.buId, this.taskId, this.buName, this.taskType,
      this.createdAt, this.createdBy, this.updatedAt, this.updatedBy);
}
