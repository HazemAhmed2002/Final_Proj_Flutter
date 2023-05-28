class Task {
  int? id;
  String? name;
  bool? isDone;
  Task({
    this.id,
    required this.name,
    this.isDone = false
  });
  factory Task.adam(bool x) {
    if (x) {
      return Task(isDone: false, name: "adam", id: 1);
    } else {
      return Task.fromMap({});
    }
  }
  Task.fromMap(Map map) {
    id = map['id'];
    name = map['name'];
    isDone = map['isDone'] == 1 ? true : false;
  }
  toMap() {
    return {"name": name, "isDone": isDone ?? true ? 1 : 0};
  }
  toMapUpdata() {
    return {"isDone": isDone ?? true ? 1 : 0};
  }

  void doneChange() {
    isDone = !isDone!;
  }
}
