import 'package:flutter/material.dart';
import 'package:task_managet/data/models/auth_utility.dart';

class UserProfileBanner extends StatelessWidget {
  const UserProfileBanner({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      tileColor: Colors.green,
      leading: CircleAvatar(
        backgroundImage: NetworkImage('https://media.sproutsocial.com/uploads/2022/06/profile-picture.jpeg'),
        radius: 15,
      ),
      title: Text(
        '${AuthUtility.userInfo.data?.firstName}' + ' ' + '${AuthUtility.userInfo.data?.lastName}',
        style: TextStyle(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        '${AuthUtility.userInfo.data?.email}',
        style: TextStyle(fontSize: 15, color: Colors.white),
      ),
    );
  }
}

