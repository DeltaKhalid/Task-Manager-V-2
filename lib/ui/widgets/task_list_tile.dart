import 'package:flutter/material.dart';

class TaskListTile extends StatelessWidget {
  const TaskListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Title will be here'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Title will be here'),
          Text('Date'),
          Row(
            children: [
              Chip(label: Text('New', style: TextStyle(color: Colors.white),), backgroundColor: Colors.blue,),
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