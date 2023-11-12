
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_managet/ui/screens/email_verification_screen.dart';

import '../../widgets/screen_background.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                'Join With Us',
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
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: 'First Name',
                ),
              ),
              const SizedBox(height: 16,),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: 'Last Name',
                ),
              ),
              const SizedBox(height: 12,),
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: 'Mobile',
                ),
              ),
              const SizedBox(height: 12,),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
              ),
              const SizedBox(height: 12,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Icon(Icons.arrow_forward),
                ),
              ),
              const SizedBox(height: 24,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "have an account?",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.6,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Sign in'),
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




