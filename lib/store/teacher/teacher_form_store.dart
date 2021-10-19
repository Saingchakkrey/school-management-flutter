import 'package:mobx/mobx.dart';
import 'package:schoolmanagement/model/models.dart';

part 'teacher_form_store.g.dart';

class TeacherFormStore = _TeacherFormStore with _$TeacherFormStore;

abstract class _TeacherFormStore with Store {
  @observable
  Teacher? teacher;

  @action
  void upsertTeacher(Teacher? teacher) {
    this.teacher = teacher;
  }
}
