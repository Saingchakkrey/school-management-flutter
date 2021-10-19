import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:schoolmanagement/screens/classroom_details_widget.dart';
import 'package:schoolmanagement/screens/classroom_list_widget.dart';
import 'package:schoolmanagement/screens/menu_widget.dart';
import 'package:schoolmanagement/screens/student_list_widget.dart';
import 'package:schoolmanagement/screens/student_search_widget.dart';
import 'package:schoolmanagement/screens/teacher_list_widget.dart';
import 'package:schoolmanagement/store/classroom/classroom_details_store.dart';
import 'package:schoolmanagement/store/classroom/classroom_store.dart';
import 'package:schoolmanagement/store/students/student_store.dart';
import 'package:schoolmanagement/store/teacher/teacher_store.dart';

FluroRouter config() {
  FluroRouter router = FluroRouter();

  router.define(
    "/",
    handler: Handler(
      handlerFunc: (context, params) => MenuWidget(),
    ),
    transitionType: TransitionType.cupertino,
  );

  router.define(
    "/classrooms",
    handler: Handler(
      handlerFunc: (context, params) => Consumer<ClassroomStore>(
        builder: (_, classroomStore, __) => ClassroomListWidget(classroomStore: classroomStore),
      ),
    ),
    transitionType: TransitionType.cupertino,
  );

  router.define(
    "/classroom_details/:id",
    handler: Handler(
      handlerFunc: (context, params) {
        final id = int.parse(params["id"]?.first ?? "0");
        return Consumer4<ClassroomStore, ClassroomDetailStore, TeacherStore, StudentStore>(
          builder: (_, classroomStore, classroomDetailStore, teacherStore, studentStore, __) =>
              ClassroomDetailsWidget(
            classroomStore: classroomStore,
            classroomDetailStore: classroomDetailStore,
            teacherStore: teacherStore,
            studentStore: studentStore,
            classroomID: id,
          ),
        );
      },
    ),
    transitionType: TransitionType.cupertino,
  );

  router.define(
    "/teachers",
    handler: Handler(
      handlerFunc: (context, params) => Consumer2<ClassroomStore, TeacherStore>(
        builder: (_, classroomStore, teacherStore, __) => TeacherListWidget(
          classroomStore: classroomStore,
          teacherStore: teacherStore,
        ),
      ),
    ),
    transitionType: TransitionType.cupertino,
  );

  router.define(
    "/students",
    handler: Handler(
      handlerFunc: (context, params) => Consumer2<ClassroomStore, StudentStore>(
        builder: (_, classroomStore, studentStore, __) => StudentListWidget(
          classroomStore: classroomStore,
          studentStore: studentStore,
        ),
      ),
    ),
    transitionType: TransitionType.cupertino,
  );

  router.define(
    "/students_search",
    handler: Handler(
      handlerFunc: (context, params) => Consumer2<ClassroomStore, StudentStore>(
        builder: (_, classroomStore, studentStore, __) => StudentSearchWidget(
          classroomStore: classroomStore,
          studentStore: studentStore,
        ),
      ),
    ),
    transitionType: TransitionType.fadeIn,
  );

  return router;
}
