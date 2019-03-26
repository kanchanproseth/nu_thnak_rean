class MyClassModel {
  final int id;
  final String name;
  final int member;
  final String section;
  final String room;
  final String subject;

  MyClassModel.fromJson(Map<String, dynamic> parsedJson)
    : id = parsedJson['id'],
      name = parsedJson['name'],
      member = parsedJson['member'],
      section = parsedJson['section'],
      room = parsedJson['room'],
      subject = parsedJson['subject'];

}