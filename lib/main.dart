import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schoolmanagement/routes.dart' as routes;
import 'package:schoolmanagement/store/classroom/classroom_details_store.dart';
import 'package:schoolmanagement/store/classroom/classroom_form_store.dart';
import 'package:schoolmanagement/store/classroom/classroom_store.dart';
import 'package:schoolmanagement/store/students/student_store.dart';
import 'package:schoolmanagement/store/teacher/teacher_store.dart';

FluroRouter router = routes.config();

void main() {
  runApp(AppProvider(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      onGenerateRoute: router.generator,
    );
  }
}

class AppProvider extends StatelessWidget {
  final Widget child;

  const AppProvider({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ClassroomStore>(create: (_) => ClassroomStore()),
        Provider<ClassroomDetailStore>(create: (_) => ClassroomDetailStore()),
        Provider<ClassroomFormStore>(create: (_) => ClassroomFormStore()),
        Provider<TeacherStore>(create: (_) => TeacherStore()),
        Provider<StudentStore>(create: (_) => StudentStore()),
      ],
      child: child,
    );
  }
}
