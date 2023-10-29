class EventData {
  List<CalenderData>? flasgship;
  List<CalenderData>? club;
  List<CalenderData>? department;
  List<CalenderData>? workshops;
  List<CalenderData>? concalve;
  List<CalenderData>? funactivities;
  List<CalenderData>? cultural;
  List<CalenderData>? fairsexhibitions;

  EventData(
      {this.flasgship,
        this.club,
        this.department,
        this.workshops,
        this.concalve,
        this.funactivities,
        this.cultural,
        this.fairsexhibitions,});

  EventData.fromJson(Map<String, dynamic> json) {
    if (json['FLAGSHIP'] != null) {
      flasgship = <CalenderData>[];
      json['FLAGSHIP'].forEach((v) {
        flasgship!.add(CalenderData.fromJson(v));
      });
    }
    if (json['CLUB'] != null) {
      club = <CalenderData>[];
      json['CLUB'].forEach((v) {
        club!.add(CalenderData.fromJson(v));
      });
    }
    if (json['DEPARTMENT'] != null) {
      department = <CalenderData>[];
      json['DEPARTMENT'].forEach((v) {
        department!.add(CalenderData.fromJson(v));
      });
    }
    if (json['WORKSHOPS'] != null) {
      workshops = <CalenderData>[];
      json['WORKSHOPS'].forEach((v) {
        workshops!.add(CalenderData.fromJson(v));
      });
    }
    if (json['CONCLAVE'] != null) {
      concalve = <CalenderData>[];
      json['CONCLAVE'].forEach((v) {
        concalve!.add(CalenderData.fromJson(v));
      });
    }
    if (json['FUN ACTIVITIES'] != null) {
      funactivities = <CalenderData>[];
      json['FUN ACTIVITIES'].forEach((v) {
        funactivities!.add(CalenderData.fromJson(v));
      });
    }
    if (json['CULTURAL'] != null) {
      cultural = <CalenderData>[];
      json['CULTURAL'].forEach((v) {
        cultural!.add(CalenderData.fromJson(v));
      });
    }
    if (json['FAIRS/EXHIBITIONS'] != null) {
      fairsexhibitions = <CalenderData>[];
      json['FAIRS/EXHIBITIONS'].forEach((v) {
        fairsexhibitions!.add(CalenderData.fromJson(v));
      });
    }
  }

}

class CalenderData {
  String? name;
  String? startTime;
  String? endTime;
  String? organiser;

  CalenderData({this.name, this.startTime, this.endTime, this.organiser});

  CalenderData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    organiser = json['organiser'];
  }

}
