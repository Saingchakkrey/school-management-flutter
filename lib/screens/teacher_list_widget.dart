import 'package:flutter/material.dart';
import 'package:schoolmanagement/store/classroom/classroom_store.dart';
import 'package:schoolmanagement/store/teacher/teacher_store.dart';

class TeacherListWidget extends StatefulWidget {
  final ClassroomStore classroomStore;
  final TeacherStore teacherStore;

  const TeacherListWidget({Key? key, required this.teacherStore, required this.classroomStore})
      : super(key: key);

  @override
  _TeacherListWidgetState createState() => _TeacherListWidgetState();
}

class _TeacherListWidgetState extends State<TeacherListWidget> {
  @override
  void initState() {
    super.initState();
    widget.classroomStore.fetchClassrooms();
    widget.teacherStore.fetchTeachers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teachers"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: ListView(
        children: widget.teacherStore.teachers.map((teacher) {
          return ListTile(
            title: Text(teacher.fullName ?? ""),
            subtitle: Text("Class: ${widget.classroomStore.classroomByID(teacher.classroomID ?? 0)?.name}"),
          );
        }).toList(),
      ),
    );
  }
}
