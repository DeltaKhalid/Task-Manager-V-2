import 'package:flutter/material.dart';
import 'package:task_managet/data/models/auth_utility.dart';
import 'package:task_managet/ui/screens/auth/login_screen.dart';
import 'package:task_managet/ui/screens/update_profile_screen.dart';

class UserProfileBanner extends StatefulWidget {
  final bool? isUpdateScreen;
  const UserProfileBanner({
    super.key, this.isUpdateScreen,
  });

  @override
  State<UserProfileBanner> createState() => _UserProfileBannerState();
}

class _UserProfileBannerState extends State<UserProfileBanner> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      // onTap: () {
      //   if ((widget.isUpdateScreen ?? false) == false){
      //     Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateProfileScreen(),),);
      //   }
      // },
      backgroundColor: Colors.green,
      // leading: CircleAvatar(
      //   backgroundImage: NetworkImage('https://media.sproutsocial.com/uploads/2022/06/profile-picture.jpeg'),
      //   radius: 15,
      // ),
      title: GestureDetector(
        onTap: () {
          if ((widget.isUpdateScreen ?? false) == false){
            Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateProfileScreen(),),);
          }
        },
        child: Row(
          children: [
            Visibility(
              visible: (widget.isUpdateScreen ?? false) == false,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage('https://media.sproutsocial.com/uploads/2022/06/profile-picture.jpeg'),
                    radius: 15,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16,),
            Column(
              children: [
                Text(
                    '${AuthUtility.userInfo.data?.firstName}',
                  style: TextStyle(
                      fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
                ),
                Text(
                  '${AuthUtility.userInfo.data?.email}',
                  //'${AuthUtility.userInfo.data?.firstName}',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          onPressed: () async {
            await AuthUtility.clearUserInfo();
            if (mounted) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                      (route) => false);
            }
          },
          icon: Icon(Icons.logout),
        ),
      ]
    );
  }
}

