import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:schoolmanagement/store/classroom/classroom_details_store.dart';
import 'package:schoolmanagement/store/classroom/classroom_store.dart';
import 'package:schoolmanagement/store/students/student_store.dart';
import 'package:schoolmanagement/store/teacher/teacher_store.dart';

class ClassroomDetailsWidget extends StatefulWidget {
  final int classroomID;
  final ClassroomStore classroomStore;
  final ClassroomDetailStore classroomDetailStore;
  final TeacherStore teacherStore;
  final StudentStore studentStore;

  const ClassroomDetailsWidget({
    Key? key,
    required this.classroomID,
    required this.classroomStore,
    required this.classroomDetailStore,
    required this.teacherStore,
    required this.studentStore,
  }) : super(key: key);

  @override
  _ClassroomDetailsWidgetState createState() => _ClassroomDetailsWidgetState();
}

class _ClassroomDetailsWidgetState extends State<ClassroomDetailsWidget> {
  @override
  void initState() {
    super.initState();
    final classroom = widget.classroomStore.classroomByID(widget.classroomID);
    widget.classroomDetailStore.updateClassroomState(classroom);

    widget.teacherStore.fetchTeacherByClassID(widget.classroomID);
    widget.studentStore.fetchStudentByClassroomID(widget.classroomID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Classroom ${widget.classroomDetailStore.classroom?.name ?? widget.classroomID}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Teacher"),
            Observer(builder: (_) {
              final teacher = widget.teacherStore.teacherByClassroomID(widget.classroomID);
              return Visibility(
                visible: teacher != null,
                child: ListTile(leading: Icon(Icons.person), title: Text(teacher?.fullName ?? "")),
                replacement: Center(child: Text("NO TEACHER ASSIGNED")),
              );
            }),
            Text("Students"),
            Observer(builder: (_) {
              final students = widget.studentStore.studentsByClassroomID(widget.classroomID);
              return Column(
                children: students.map((student) {
                  return ListTile(
                    leading: Icon(Icons.person),
                    title: Text(student.fullName ?? ""),
                  );
                }).toList(),
              );
            }),
          ],
        ),
      ),
    );
  }
}
