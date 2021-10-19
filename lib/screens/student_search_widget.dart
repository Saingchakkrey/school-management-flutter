import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:schoolmanagement/store/classroom/classroom_store.dart';
import 'package:schoolmanagement/store/students/student_store.dart';

class StudentSearchWidget extends StatefulWidget {
  final StudentStore studentStore;
  final ClassroomStore classroomStore;

  StudentSearchWidget({Key? key, required this.studentStore, required this.classroomStore}) : super(key: key);

  @override
  _StudentSearchWidgetState createState() => _StudentSearchWidgetState();
}

class _StudentSearchWidgetState extends State<StudentSearchWidget> {
  String queryName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          autofocus: true,
          onChanged: (qn) {
            widget.studentStore.fetchStudentByQueryName(qn);
            setState(() {
              queryName = qn;
            });
          },
        ),
      ),
      body: Observer(
        builder: (_) {
          return ListView(
            children: widget.studentStore.studentsByQueryName(queryName).map((student) {
              return ListTile(
                title: Text(student.fullName ?? ""),
                subtitle:
                    Text("Class: ${widget.classroomStore.classroomByID(student.classroomID ?? 0)?.name}"),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
