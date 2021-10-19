import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:schoolmanagement/main.dart';
import 'package:schoolmanagement/store/classroom/classroom_store.dart';

class ClassroomListWidget extends StatefulWidget {
  final ClassroomStore classroomStore;

  ClassroomListWidget({required this.classroomStore});

  @override
  _ClassroomListWidgetState createState() => _ClassroomListWidgetState();
}

class _ClassroomListWidgetState extends State<ClassroomListWidget> {
  @override
  void initState() {
    super.initState();
    widget.classroomStore.fetchClassrooms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Classrooms")),
      body: Observer(builder: (_) => ListView(
        children: widget.classroomStore.classrooms.map((classroom) => ListTile(
          leading: Icon(Icons.book),
          title: Text(classroom.name ?? "NO NAME"),
          onTap: () => router.navigateTo(context, "/classroom_details/${classroom.id}"),
        )).toList(),
      )
      ),
    );
  }
}
