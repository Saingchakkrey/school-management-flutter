import 'package:flutter/material.dart';
import 'package:schoolmanagement/main.dart';
import 'package:schoolmanagement/store/classroom/classroom_store.dart';
import 'package:schoolmanagement/store/students/student_store.dart';
import 'package:schoolmanagement/store/teacher/teacher_store.dart';

class StudentListWidget extends StatefulWidget {
  final ClassroomStore classroomStore;
  final StudentStore studentStore;

  const StudentListWidget({Key? key, required this.studentStore, required this.classroomStore})
      : super(key: key);

  @override
  _StudentListWidgetState createState() => _StudentListWidgetState();
}

class _StudentListWidgetState extends State<StudentListWidget> {
  @override
  void initState() {
    super.initState();
    widget.classroomStore.fetchClassrooms();
    widget.studentStore.fetchStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Students"),
        actions: [
          IconButton(onPressed: () => router.navigateTo(context, 'students_search'), icon: Icon(Icons.search))
        ],
      ),
      body: ListView(
        children: widget.studentStore.students.map((student) {
          return ListTile(
            title: Text(student.fullName ?? ""),
            subtitle: Text("Class: ${widget.classroomStore.classroomByID(student.classroomID ?? 0)?.name}"),
          );
        }).toList(),
      ),
    );
  }
}
