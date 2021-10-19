import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:schoolmanagement/models/models.dart';

part 'teacher_store.g.dart';

class TeacherStore = _TeacherStore with _$TeacherStore;

abstract class _TeacherStore with Store {
  @readonly
  List<Teacher> _dummyTeachers = [
    Teacher(
      id: 1,
      classroomID: 1,
      age: 42,
      deviceOS: describeEnum(DeviceOS.ios),
      transportation: describeEnum(Transportation.car),
      fullName: "Sokreoun",
    ),
    Teacher(
      id: 2,
      classroomID: 2,
      age: 54,
      deviceOS: describeEnum(DeviceOS.android),
      transportation: describeEnum(Transportation.motor),
      fullName: "Virak",
    ),
    Teacher(
      id: 3,
      classroomID: 3,
      age: 38,
      deviceOS: describeEnum(DeviceOS.ios),
      transportation: describeEnum(Transportation.bus),
      fullName: "Rotha",
    ),
  ];

  @observable
  ObservableList<Teacher> teachers = ObservableList.of([]);

  @computed
  Teacher? Function(int) get teacherByClassroomID =>
          (int classroomID) {
        return this.teachers.firstWhereOrNull((teacher) => teacher.classroomID == classroomID);
      };

  @action
  void fetchTeachers() {
    final newTeachers = _dummyTeachers;
    updateTeachersState(newTeachers);
  }

  @action
  void fetchTeacherByClassID(int classroomID) {
    final newTeachers = _dummyTeachers.where((teacher) => teacher.classroomID == classroomID).toList();
    updateTeachersState(newTeachers);
  }

  @action
  void updateTeachersState(List<Teacher> newTeachers) {
    newTeachers.forEach((nt) {
      final foundIndex = this.teachers.indexWhere((teacher) => teacher.id == nt.id);

      if (foundIndex < 0) {
        this.teachers.add(nt);
      } else {
        this.teachers[foundIndex] = nt;
      }
    });
  }
}
