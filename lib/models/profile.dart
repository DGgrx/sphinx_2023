import 'package:sphinx_2023/models/event.dart';
import 'package:sphinx_2023/models/pass.dart';

class Profile {
  String? token;
  String? sId;
  String? password;
  String? email;
  String? type;
  List<Events>? events = [];
  bool? isAmbassador;
  bool? isMnit;
  bool? isEmailVerified;
  bool? isMobileNumberVerified;
  List<Passes>? passes = [];
  String? createdAt;
  String? updatedAt;
  int? iV;
  int? phoneNumber;
  String? uniqueID;
  String? collegeName;
  String? name;
  bool? enteredMNIT;

  Profile(
      {
        this.token,
        this.sId,
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
        this.name,
      this.enteredMNIT});

  Profile.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    password = json['password'];
    email = json['email'];
    type = json['type'];
    if (json['events'] != null) {
      events = [];
      json['events'].forEach((v) {
        events!.add(Events.fromJson(v));
      });
    }
    isAmbassador = json['isAmbassador'];
    isMnit = json['isMnit'];
    isEmailVerified = json['isEmailVerified'];
    isMobileNumberVerified = json['isMobileNumberVerified'];
    if (json['passes'] != null) {
      passes = <Passes>[];
      json['passes'].forEach((v) {
        passes!.add(Passes.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    phoneNumber = json['phoneNumber'];
    uniqueID = json['uniqueID'];
    collegeName = json['collegeName'];
    name = json['name'];
    enteredMNIT = json['enteredMnit'];
  }
}
