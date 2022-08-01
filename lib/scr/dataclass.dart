
class Data {
  int? id;
  String? title;
  String? text;

  Data({
    this.id,
    required this.title,
    required this.text,
  });

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Data.fromMap(Map<String,dynamic> res)
  {
    id=res["id"];
    title=res['title'];
    text= res['text'];
  }
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "title": title,
      "text": text
    };

    if (id != null) {
      map['id'] = id;
    }

    return map;
  }
}