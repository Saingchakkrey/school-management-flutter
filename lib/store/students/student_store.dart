import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:schoolmanagement/model/models.dart';

part 'student_store.g.dart';

class StudentStore = _StudentStore with _$StudentStore;

abstract class _StudentStore with Store {
  @readonly
  List<Student> _dummyStudents = [
    Student(
      id: 1,
      fullName: "Raksmey",
      transportation: describeEnum(Transportation.bike),
      deviceOS: describeEnum(DeviceOS.android),
      age: 19,
      classroomID: 1,
    ),
    Student(
      id: 2,
      fullName: "Sokpha",
      transportation: describeEnum(Transportation.motor),
      deviceOS: describeEnum(DeviceOS.ios),
      age: 18,
      classroomID: 1,
    ),
    Student(
      id: 3,
      fullName: "Rika",
      transportation: describeEnum(Transportation.bike),
      deviceOS: describeEnum(DeviceOS.android),
      age: 19,
      classroomID: 2,
    ),
    Student(
      id: 4,
      fullName: "Bora",
      transportation: describeEnum(Transportation.bike),
      deviceOS: describeEnum(DeviceOS.android),
      age: 19,
      classroomID: 2,
    ),
    Student(
      id: 5,
      fullName: "Reaksa",
      transportation: describeEnum(Transportation.bike),
      deviceOS: describeEnum(DeviceOS.android),
      age: 19,
      classroomID: 3,
    ),
    Student(
      id: 6,
      fullName: "Sokun",
      transportation: describeEnum(Transportation.bike),
      deviceOS: describeEnum(DeviceOS.android),
      age: 19,
      classroomID: 3,
    ),
    Student(
      id: 7,
      fullName: "Mara",
      transportation: describeEnum(Transportation.bike),
      deviceOS: describeEnum(DeviceOS.android),
      age: 19,
      classroomID: 2,
    ),
  ];

  @observable
  ObservableList<Student> students = ObservableList.of([]);

  @computed
  List<Student> Function(int) get studentsByClassroomID => (int classroomID) {
        return this.students.where((student) => student.classroomID == classroomID).toList();
      };

  @computed
  List<Student> Function(String) get studentsByQueryName => (String queryName) {
        return this
            .students
            .where((student) => student.fullName!.toLowerCase().contains(queryName.toLowerCase()))
            .toList();
      };

  @action
  void fetchStudents() {
    final newStudents = _dummyStudents;
    updateStudentsState(newStudents);
  }

  @action
  void fetchStudentByClassroomID(int classroomID) {
    final newStudents = _dummyStudents.where((student) => student.classroomID == classroomID).toList();
    updateStudentsState(newStudents);
  }

  @action
  void fetchStudentByQueryName(String qn) {
    final newStudents = _dummyStudents
        .where((student) => student.fullName!.toLowerCase().contains(qn.toLowerCase()))
        .toList();
    updateStudentsState(newStudents);
  }

  @action
  void updateStudentsState(List<Student> newStudents) {
    newStudents.forEach((ns) {
      final foundIndex = this.students.indexWhere((student) => student.id == ns.id);

      if (foundIndex < 0) {
        this.students.add(ns);
      } else {
        this.students[foundIndex] = ns;
      }
    });
  }
}
