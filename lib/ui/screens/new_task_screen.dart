import 'package:flutter/material.dart';
import 'package:task_managet/data/models/network_response.dart';
import 'package:task_managet/data/models/summary_count_model.dart';
import 'package:task_managet/data/models/task_list_mode.dart';
import 'package:task_managet/data/services/network_caller.dart';
import 'package:task_managet/ui/screens/add_new_task_screen.dart';
import 'package:task_managet/ui/utils/assets_utils.dart';

import '../../data/utils/urls.dart';
import '../widgets/summary_card.dart';
import '../widgets/task_list_tile.dart';
import '../widgets/user_profile_banner.dart';
import 'package:http/http.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {

  ///======================================== All Variables ==================================================///
  bool _getCountSummaryInProgress = false;
  bool _getNewTaskInProgress = false;


  ///======================================== Init State Call ================================================///
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // after widget buind
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getCountSummary();
      getNewTasks();
    });
  }


  ///======================================== getCountSummary Function (Task Status Count) API Call =========///
  SummaryCountModel _summaryCountModel = SummaryCountModel();
  /// API call start
  Future<void> getCountSummary() async{
    _getCountSummaryInProgress = true;
    if (mounted) {
      setState(() {});
    }
    final NetworkResponse response = await NetworkCaller().getRequest(Urls.taskStatusCount);
    if (response.isSuccess) {
      _summaryCountModel = SummaryCountModel.fromJson(response.body!);
    }else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Summary Data get Failede!'),),);
      }
    }
    _getCountSummaryInProgress = false;
    if (mounted) {
      setState(() {});
    }

  }

  ///======================================== getNewTask() Function (/listTaskByStatus/New) API Call ========///
  TaskListModel _taskListModel = TaskListModel();
  Future<void> getNewTasks() async {
    _getNewTaskInProgress = true;
    if (mounted) {
      setState(() {});
    }
    final NetworkResponse response = await NetworkCaller().getRequest(Urls.newTask);
    if (response.isSuccess) {
      _taskListModel = TaskListModel.fromJson(response.body!);
      print('get new task response 777 : ${_taskListModel.data?.length}');
    }else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(' get new task data Failede!'),),);
      }
    }
    _getNewTaskInProgress = false;
    if (mounted) {
      setState(() {});
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const UserProfileBanner(),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: _getCountSummaryInProgress ? LinearProgressIndicator() : Row(
                children: [
                  Expanded(
                    child: SummaryCard(
                      title: 'New',
                      number: 123,
                    ),
                  ),
                  Expanded(
                    child: SummaryCard(
                      title: 'Progress',
                      number: 123,
                    ),
                  ),
                  Expanded(
                    child: SummaryCard(
                      title: 'Cancel',
                      number: 123,
                    ),
                  ),
                  Expanded(
                    child: SummaryCard(
                      title: 'Complete',
                      number: 123,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(


              child: ListView.separated(
                itemCount: _taskListModel.data?.length ?? 0,
                  itemBuilder: (context, index){
                    return ListTile(
                      title: Text(_taskListModel.data![index].title ?? 'Unknown'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(_taskListModel.data![index].description ?? ''),
                          Text(_taskListModel.data![index].createdDate ?? ''),
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


                    // return ListTile(
                    //   title: Text('${_taskListModel.data?[index].title}'),
                    //   // Add additional widgets or customize ListTile as needed
                    //   // For example, you can add onTap to handle item taps.
                    //   // onTap: () {
                    //   //   print('Tapped on ${items[index]}');
                    //   // },
                    // );



                  }, separatorBuilder: (BuildContext context, int index) {
                  return Divider(height: 4,);
              },),
              
              
              // child: ListView.separated(
              //   itemCount: _taskListModel.data?.length ?? 0,                                                ///*** very important "by default 0" that why
              //     itemBuilder: (context, index){
              //       return TaskListTile(
              //         data: _taskListModel.data![index],
              //       );
              //     }, separatorBuilder: (BuildContext context, int index) {
              //      return const Divider(height: 4,);
              // },),
              
              
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddNewTaskScreen(),),);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}






