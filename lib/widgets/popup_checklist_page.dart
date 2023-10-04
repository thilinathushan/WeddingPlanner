import 'package:flutter/material.dart';
import '../app_style.dart';
import 'add_task.dart';

class PopupChecklistPage extends StatefulWidget {
  final String title;

  const PopupChecklistPage({super.key, required this.title});

  @override
  State<PopupChecklistPage> createState() => _PopupChecklistPageState();
}

class _PopupChecklistPageState extends State<PopupChecklistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kDarkWhiteColor,
        foregroundColor: kPrimaryBlack,
        title: Text(widget.title),
        forceMaterialTransparency: true,
      ),
      body: const Center(
        child: Text("Data"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTask(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
