import 'package:flutter/material.dart';
import '../../data/models/task_list_mode.dart';

class TaskListTile extends StatelessWidget {

  final TaskData data;

  const TaskListTile({
    super.key, required this.data,
  });



  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(data.title ?? 'UnKnown'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(data.description ?? ''),
          Text(data.createdDate ?? ''),
          Row(
            children: [
              Chip(
                label: Text(
                  data.status ?? 'New',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.blue,
              ),
              Spacer(),
              IconButton(onPressed: (){}, icon: Icon(Icons.delete_forever_outlined), color: Colors.red.shade300,),
              IconButton(onPressed: (){}, icon: Icon(Icons.edit), color: Colors.greenAccent,),
            ],
          )
        ],
      ),
    );
  }
}