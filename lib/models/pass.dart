class Passes {
  int? type;
  String? sId;
  String? name;
  String? detail;
  int? amount;
  String? imageUrl;
  List<String>? eventId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Passes(
      {this.type,
        this.sId,
        this.name,
        this.detail,
        this.amount,
        this.imageUrl,
        this.eventId,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Passes.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    sId = json['_id'];
    name = json['name'];
    detail = json['detail'];
    amount = json['amount'];
    imageUrl = json['imageUrl'];
    eventId = json['eventId'].cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }


}
