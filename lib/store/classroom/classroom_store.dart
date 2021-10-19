import 'package:collection/collection.dart';
import 'package:mobx/mobx.dart';
import 'package:schoolmanagement/model/models.dart';

part 'classroom_store.g.dart';

class ClassroomStore = _ClassroomStore with _$ClassroomStore;

abstract class _ClassroomStore with Store {
  @observable
  ObservableList<Classroom> classrooms = ObservableList.of([]);

  @computed
  Classroom? Function(int) get classroomByID =>
      (int classroomID) => classrooms.firstWhereOrNull((classroom) => classroom.id == classroomID);

  @action
  void fetchClassrooms() {
    List<Classroom> classrooms = [
      Classroom(id: 1, teacherID: 1, name: "A"),
      Classroom(id: 2, teacherID: 2, name: "B"),
      Classroom(id: 3, teacherID: 3, name: "C"),
    ];
    this.classrooms = ObservableList.of(classrooms);
  }

  @action
  void addClassroom(Classroom classroom) {
    this.classrooms.add(classroom);
  }
}
