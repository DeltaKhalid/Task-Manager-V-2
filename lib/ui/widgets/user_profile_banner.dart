import 'package:flutter/material.dart';

class UserProfileBanner extends StatelessWidget {
  const UserProfileBanner({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return const ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      tileColor: Colors.green,
      leading: CircleAvatar(
        backgroundImage: NetworkImage('https://media.sproutsocial.com/uploads/2022/06/profile-picture.jpeg'),
        radius: 15,
      ),
      title: Text('User Name', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),),
      subtitle: Text('User email', style: TextStyle(fontSize: 15, color: Colors.white),),
    );
  }
}

