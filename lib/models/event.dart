class Event {
  String? sId;
  String? name;
  String? description;
  String? rulebook;
  String? category;
  String? from;
  String? time;
  String? location;
  List<String>? coordinators;
  Admin? admin;
  List<Updates>? updates;
  int? status;
  bool? ended;
  int? amount;
  bool? freeForMNIT;
  int? minTeamSize;
  int? maxTeamSize;
  String? imageUrl;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? redirectUrl;
  List<String>? attendance;

  Event(
      {this.sId,
      this.name,
      this.description,
      this.rulebook,
      this.category,
      this.from,
      this.time,
      this.location,
      this.coordinators,
      this.admin,
      this.updates,
      this.status,
      this.ended,
      this.amount,
      this.freeForMNIT,
      this.minTeamSize,
      this.maxTeamSize,
      this.imageUrl,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.redirectUrl,
      this.attendance});

  Event.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    rulebook = json['rulebook'];
    category = json['category'];
    from = json['from'];
    time = json['time'];
    location = json['location'];
    if (json['coordinators'] != null) {
      coordinators = [];
      json['coordinators'].forEach((v) {
        coordinators!.add(v);
      });
    }
    if (json['admin'] != null)
    admin = Admin.fromJson(json['admin']);

    if (json['updates'] != null) {
      updates = <Updates>[];
      json['updates'].forEach((v) {
        updates!.add(Updates.fromJson(v));
      });
    }

    status = json['status'];
    ended = json['ended'];
    amount = json['amount'];
    freeForMNIT = json['freeForMNIT'];
    minTeamSize = json['minTeamSize'];
    maxTeamSize = json['maxTeamSize'];
    imageUrl = json['imageUrl'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    redirectUrl = json['redirectUrl'];
    attendance = json['attendance'].cast<String>();
  }
}

class Updates {
  String? message;
  String? timestamp;
  String? sId;

  Updates({this.message, this.timestamp, this.sId});

  Updates.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    timestamp = json['timestamp'];
    sId = json['_id'];
  }
}


class Admin {
  String? sId;
  String? email;
  String? type;
  List<Events>? events;
  bool? isAmbassador;
  bool? isMnit;
  bool? isEmailVerified;
  bool? isMobileNumberVerified;
  List<String>? passes;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? collegeName;
  String? name;
  String? referredBy;

  Admin(
      {this.sId,
        this.email,
        this.type,
        this.events,
        this.isAmbassador,
        this.isMnit,
        this.isEmailVerified,
        this.isMobileNumberVerified,
        this.passes,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.collegeName,
        this.name,
        this.referredBy});

  Admin.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    type = json['type'];
    if (json['events'] != null) {
      events = <Events>[];
      json['events'].forEach((v) {
        events!.add(Events.fromJson(v));
      });
    }
    isAmbassador = json['isAmbassador'];
    isMnit = json['isMnit'];
    isEmailVerified = json['isEmailVerified'];
    isMobileNumberVerified = json['isMobileNumberVerified'];
    if (json['passes'] != null) {
      passes = [];
      json['passes'].forEach((v) {
        passes!.add(v);
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    collegeName = json['collegeName'];
    name = json['name'];
    referredBy = json['referredBy'];
  }

}

class Events {
  String? event;
  String? teamId;
  String? sId;

  Events({this.event, this.teamId, this.sId});

  Events.fromJson(Map<String, dynamic> json) {
    event = json['event'];
    teamId = json['teamId'];
    sId = json['_id'];
  }

}

