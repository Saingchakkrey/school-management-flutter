import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

enum DeviceOS { android, ios, wp }
enum Transportation { car, train, bus, motor, bike, walk }

@JsonSerializable()
class Classroom {
  int? id;
  String? name;
  int? teacherID;
  List<Student>? students;

  Classroom({this.id, this.name, this.teacherID, this.students});

  Map<String, dynamic> toJson() => _$ClassroomToJson(this);

  factory Classroom.fromJson(Map<String, dynamic> json) => _$ClassroomFromJson(json);
}

abstract class Person {
  int? id;
  int? classroomID;
  String? fullName;
  int? age;
  String? deviceOS;
  String? transportation;

  Person({this.id, this.classroomID, this.fullName, this.age, this.deviceOS, this.transportation});
}

@JsonSerializable()
class Teacher extends Person {
  Teacher({int? id, int? classroomID, String? fullName, int? age, String? deviceOS, String? transportation})
      : super(
          id: id,
          classroomID: classroomID,
          fullName: fullName,
          age: age,
          deviceOS: deviceOS,
          transportation: transportation,
        );

  Map<String, dynamic> toJson() => _$TeacherToJson(this);

  factory Teacher.fromJson(Map<String, dynamic> json) => _$TeacherFromJson(json);
}

@JsonSerializable()
class Student extends Person {
  Student({int? id, int? classroomID, String? fullName, int? age, String? deviceOS, String? transportation})
      : super(
          id: id,
          classroomID: classroomID,
          fullName: fullName,
          age: age,
          deviceOS: deviceOS,
          transportation: transportation,
        );

  Map<String, dynamic> toJson() => _$StudentToJson(this);

  factory Student.fromJson(Map<String, dynamic> json) => _$StudentFromJson(json);
}
