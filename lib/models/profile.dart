import 'package:sphinx_2023/models/event.dart';

class Profile {
  String? sId;
  String? password;
  String? email;
  String? type;
  List<Event>? events = [];
  bool? isAmbassador;
  bool? isMnit;
  bool? isEmailVerified;
  bool? isMobileNumberVerified;
  List<String>? passes = [];
  String? createdAt;
  String? updatedAt;
  int? iV;
  int? phoneNumber;
  String? uniqueID;
  String? collegeName;
  String? name;

  Profile(
      {this.sId,
        this.password,
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
        this.phoneNumber,
        this.uniqueID,
        this.collegeName,
        this.name});

  Profile.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    password = json['password'];
    email = json['email'];
    type = json['type'];
    if (json['coordinators'] != null) {
      events = [];
      json['events'].forEach((v) {
        events!.add(Event.fromJson(v));
      });
    }
    isAmbassador = json['isAmbassador'];
    isMnit = json['isMnit'];
    isEmailVerified = json['isEmailVerified'];
    isMobileNumberVerified = json['isMobileNumberVerified'];
    passes = json['passes'].cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    phoneNumber = json['phoneNumber'];
    uniqueID = json['uniqueID'];
    collegeName = json['collegeName'];
    name = json['name'];
  }
}
