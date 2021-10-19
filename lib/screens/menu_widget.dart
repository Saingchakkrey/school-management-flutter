import 'package:flutter/material.dart';
import 'package:schoolmanagement/main.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("School Management"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => router.navigateTo(context, '/classrooms'),
              child: Text("Classrooms"),
            ),
            ElevatedButton(
              onPressed: () => router.navigateTo(context, '/teachers'),
              child: Text("Teachers"),
            ),
            ElevatedButton(
              onPressed: () => router.navigateTo(context, '/students'),
              child: Text("Students"),
            ),
          ],
        ),
      ),
    );
  }
}
