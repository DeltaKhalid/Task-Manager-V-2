import 'package:flutter/material.dart';

import '../widgets/task_list_tile.dart';
import '../widgets/user_profile_banner.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const UserProfileBanner(),
              Expanded(
                child: ListView.separated(
                  itemCount: 20,
                  itemBuilder: (context, index){
                    return TaskListTile();
                  }, separatorBuilder: (BuildContext context, int index) {
                  return const Divider(height: 4,);
                },),
              )
            ],
          ),
        )
    );
  }
}
