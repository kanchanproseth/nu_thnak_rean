class UserModel {
  final int id;
  final String name;
  final String occupation;
  final List<int> myClassIds;

  UserModel.fromJson(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'],
        name = parsedJson['name'],
        occupation = parsedJson['occupation'],
        myClassIds = List.from(parsedJson['my_class']);

  @override
  String toString() {
    print("""
      {
        "id": $id,
        "name": $name,
        "occupation": $occupation,
        "myClassIds": $myClassIds
      }
    """);
    return super.toString();
  }
}
