import 'package:mobx/mobx.dart';
import 'package:schoolmanagement/models/models.dart';

part 'classroom_details_store.g.dart';

class ClassroomDetailStore = _ClassroomDetailStore with _$ClassroomDetailStore;

abstract class _ClassroomDetailStore with Store {
  @observable
  Classroom? classroom;

  @action
  void updateClassroomState(Classroom? classroom) {
    this.classroom = classroom;
  }
}
