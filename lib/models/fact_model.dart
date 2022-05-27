class FactModel {
  FactModel({
    this.status,
    this.id,
    this.user,
    this.text,
    this.v,
    this.source,
    this.updatedAt,
    this.type,
    this.createdAt,
    this.deleted,
    this.used,
  });

  Status? status;
  String? id;
  String? user;
  String? text;
  int? v;
  String? source;
  DateTime? updatedAt;
  String? type;
  DateTime? createdAt;
  bool? deleted;
  bool? used;

  factory FactModel.fromJson(Map<String, dynamic> json) => FactModel(
        status: Status.fromJson(json["status"]),
        id: json["_id"],
        user: json["user"],
        text: json["text"],
        v: json["__v"],
        source: json["source"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        type: json["type"],
        createdAt: DateTime.parse(json["createdAt"]),
        deleted: json["deleted"],
        used: json["used"],
      );
}

class Status {
  Status({
    this.verified,
    this.sentCount,
  });

  bool? verified;
  int? sentCount;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        verified: json["verified"],
        sentCount: json["sentCount"],
      );
}
