import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'show_task.dart';
import '../app_style.dart';
import '../size_config.dart';
import 'add_task.dart';

class PopupChecklistPage extends StatefulWidget {
  final String title;

  const PopupChecklistPage({
    super.key,
    required this.title,
  });

  @override
  State<PopupChecklistPage> createState() => _PopupChecklistPageState();
}

class _PopupChecklistPageState extends State<PopupChecklistPage> {
  Stream<List<DocumentSnapshot>> getTasksStream(String category) {
    return FirebaseFirestore.instance
        .collection('planning')
        .doc(category)
        .collection('tasks')
        .snapshots()
        .map((snapshot) => snapshot.docs);
  }

  void checkBoxChanged(bool? value, DocumentSnapshot taskSnapshot) async {
    bool updatedTaskCompleted = value ?? false;
    try {
      await taskSnapshot.reference
          .update({'taskCompleted': updatedTaskCompleted});
    } catch (e) {
      print('Error updating taskCompleted : $e');
    }
  }

  void deleteTask(DocumentSnapshot taskSnapshot) async {
    try {
      await taskSnapshot.reference.delete();
    } catch (e) {
      print('Error deleting task: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kDarkWhiteColor,
        foregroundColor: kPrimaryBlack,
        title: Text(widget.title),
        forceMaterialTransparency: true,
        iconTheme: const IconThemeData(color: kPrimaryBlue),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryBlue,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTask(title: widget.title),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<List<DocumentSnapshot>>(
        stream: getTasksStream(widget.title),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<DocumentSnapshot> tasks = snapshot.data!;
            if (tasks.isEmpty) {
              return const Center(
                child: Text('No Data Found.'),
              );
            }
            return Padding(
              padding: EdgeInsets.only(
                left: sizeHorizontal * 5,
                right: sizeHorizontal * 5,
              ),
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> taskData =
                      tasks[index].data() as Map<String, dynamic>;

                  return Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ShowTask(
                      taskName: taskData['taskName'],
                      taskDescripion: taskData['taskDescription'],
                      taskCompleted: taskData['taskCompleted'] ?? false,
                      onChanged: (value) =>
                          checkBoxChanged(value, tasks[index]),
                      deleteFunction: (context) => deleteTask(tasks[index]),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
