import 'package:flutter/material.dart';
import 'package:task_managet/ui/widgets/user_profile_banner.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const UserProfileBanner(),
            const SizedBox(height: 16,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add New Task',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16,),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Title'
                    ),
                  ),
                  const SizedBox(height: 8,),
                  TextFormField(
                    maxLines: 4,
                    decoration: InputDecoration(
                        hintText: 'Description'
                    ),
                  ),
                  const SizedBox(height: 16,),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => BottomNavBaseScreen()), (route) => false);
                      },
                      child: Icon(Icons.arrow_forward),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
