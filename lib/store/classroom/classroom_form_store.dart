import 'package:mobx/mobx.dart';
import 'package:schoolmanagement/models/models.dart';

part 'classroom_form_store.g.dart';

class ClassroomFormStore = _ClassroomFormStore with _$ClassroomFormStore;

abstract class _ClassroomFormStore with Store {
  @observable
  Classroom? classroom;

  @computed
  Map<String, dynamic>? get classroomMap => this.classroom?.toJson();

  @action
  void updateClassroomState(Classroom? classroom) {
    this.classroom = classroom;
  }
}
