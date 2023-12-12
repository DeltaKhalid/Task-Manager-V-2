class Urls {
  Urls._();

  static const String _baseurl = 'https://task.teamrabbil.com/api/v1';
  static String registration = '$_baseurl/registration';
  static String login = '$_baseurl/login';
  static String createTask = '$_baseurl/createTask';
  static String taskStatusCount = '$_baseurl/taskStatusCount';
  static String newTask = '$_baseurl/listTaskByStatus/New';
  static String inProgressTask = '$_baseurl/listTaskByStatus/Progress';

  static String deleteTask(String id) => '$_baseurl/deleteTask/$id';               /// ID will be change that's why
  static String updateTask(String id, String status) => '$_baseurl/updateTaskStatus/$id/$status';               /// id and status will be change that's why

// static const String _baseurl = 'http://192.168.1.189/api/v1/account';
// static String login = '$_baseurl/login';

// static const String _baseurl = 'http://192.168.1.189/api/v1/account';
// static String login = '$_baseurl/login';

}