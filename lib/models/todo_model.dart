class ToDo{
  String taskName;
  String taskContent;
  Object category;
  bool isImportant;
  bool isCompleted;
  String craetedDate;
  String? dueDate;

  ToDo({
    required this.taskName,
    required this.taskContent,
    required this.category,
    required this.isImportant,
    required this.isCompleted,
    required this.craetedDate,
    this.dueDate,
  });

  ToDo.fromJson(Map<String, dynamic> json)
      : taskName = json["taskName"],
        taskContent = json["taskContent"],
        category = json["category"],
        isImportant = json["isImportant"],
        isCompleted = json["isCompleted"],
        craetedDate = json["craetedDate"],
        dueDate = json["dueDate"];

  Map<String, dynamic> toJson() => {
    'taskName': taskName,
    'taskContent': taskContent,
    'category': category,
    'isImportant': isImportant,
    'isCompleted': isCompleted,
    'craetedDate': craetedDate,
    'dueDate': dueDate,
  };

  @override
  String toString() {
    return "Task name: $taskName\nTask content: $taskContent\nCategory: $category\nImportant: $isImportant\nCompleted: $isCompleted\nDate: $craetedDate\nDue date: $dueDate";
  }

  @override
  bool operator ==(Object other) {
    return other is ToDo &&
        other.taskName == taskName &&
        other.taskContent == taskContent &&
        other.category == category &&
        other.isImportant == isImportant &&
        other.isCompleted == isCompleted &&
        other.craetedDate == craetedDate &&
        other.dueDate == dueDate;
  }

  @override
  int get hashCode => Object.hash(taskName, taskContent, category, isImportant,
      isCompleted, craetedDate, dueDate);

  @override
  int compareTo(ToDo other) {
    int compareTaskName = this.taskName.compareTo(other.taskName);
    if(compareTaskName == 0){
      int compareTaskContent = this.taskContent.compareTo(other.taskContent);
      if(compareTaskContent == 0){
        int compareCreatedDate = this.craetedDate.compareTo(other.craetedDate);
        if(compareCreatedDate == 0){
          return 0;
        }else{
          return compareCreatedDate;
        }
      }else{
        return compareTaskContent;
      }
    }else{
      return compareTaskName;
    }
  }
}