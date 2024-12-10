class TodoApp {
   String ?id;
   String ?description;
   String ? name;

  TodoApp({
     this.id,
    required this.description,
    required this.name,
  });

  factory TodoApp.fromJson(Map<String, dynamic> json) {
    return TodoApp(
      id: json['id'] ?? '',
      description: json['description'] ?? '',
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }
}
