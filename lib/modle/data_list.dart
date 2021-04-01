import 'dart:convert';

List<DataList> dataListFromJson(List<dynamic> str) => List<DataList>.from(str.map((x) => DataList.fromJson(x)));

String dataListToJson(List<DataList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


DataList dataFromJson(String str) => DataList.fromJson(json.decode(str));

String dataToJson(DataList data) => json.encode(data.toJson());

class DataList {
  int id;
  String name;
  String keyValue;

  DataList({
    this.id,
    this.name,
    this.keyValue,
  });

  factory DataList.fromJson(Map<String, dynamic> json) => DataList(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };

  @override
  String toString() {
    return '$id-$name-$keyValue';
  }


}
