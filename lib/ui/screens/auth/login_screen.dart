
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_managet/ui/screens/auth/signup_screen.dart';
import 'package:task_managet/ui/screens/bottom_nav_base_screen.dart';
import 'package:task_managet/ui/screens/email_verification_screen.dart';
import '../../utils/assets_utils.dart';
import '../../widgets/screen_background.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 150,),
              Text(
                'Get Started With',
                // style: TextStyle(
                //     fontSize: 24,
                //     color: Colors.black,
                //     fontWeight: FontWeight.w500,
                //     ),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16,),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
              ),
              const SizedBox(height: 12,),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
              ),
              const SizedBox(height: 16,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => BottomNavBaseScreen()), (route) => false);
                  },
                  child: Icon(Icons.arrow_forward),
                ),
              ),
              const SizedBox(height: 24,),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EmailVerificationScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.6,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                    },
                    child: Text('SignUp'),
                  ),
                ],
              ),
            ],
            ),
          ),
        ),
      )
    );
  }
}




