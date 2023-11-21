
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_managet/data/models/auth_utility.dart';
import 'package:task_managet/data/models/login_model.dart';
import 'package:task_managet/data/models/network_response.dart';
import 'package:task_managet/data/services/network_caller.dart';
import 'package:task_managet/ui/screens/auth/signup_screen.dart';
import 'package:task_managet/ui/screens/bottom_nav_base_screen.dart';
import 'package:task_managet/ui/screens/email_verification_screen.dart';
import '../../../data/utils/urls.dart';
import '../../utils/assets_utils.dart';
import '../../widgets/screen_background.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool _loginInProgress = false;

  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  Future<void> login() async{
    _loginInProgress = true;
    if (mounted) {
      setState(() {});
    }
    Map<String, dynamic> requestBody = {
      "email": _emailTEController.text.trim(),
      "password": _passwordTEController.text
    };
    final NetworkResponse response = await NetworkCaller().postRequest(Urls.login, requestBody);
    _loginInProgress = false;
    if (mounted) {
      setState(() {});
    }
    /// Network call is End
    if (response.isSuccess) {

      // Login info check method
      LoginModel model = LoginModel.fromJson(response.body!);     /// ! -> used for forsed not null
      print(model.data?.mobile);
      await AuthUtility.saveUserInfo(model);


      if (mounted) {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => BottomNavBaseScreen()), (route) => false);
      }
    }else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Incorrect email or password')));
      }
    }
  }

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
                'Get Started With test 1',
                // style: TextStyle(
                //     fontSize: 24,
                //     color: Colors.black,
                //     fontWeight: FontWeight.w500,
                //     ),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16,),
              TextFormField(
                controller: _emailTEController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
              ),
              const SizedBox(height: 12,),
              TextFormField(
                controller: _passwordTEController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
              ),
              const SizedBox(height: 16,),
              ///============================================ Login Button is Start ====================================///
              SizedBox(
                width: double.infinity,
                child: Visibility(
                  visible: _loginInProgress == false,
                  replacement: const Center(child: CircularProgressIndicator(),),
                  child: ElevatedButton(
                    onPressed: () {
                      login();
                    },
                    child: const Icon(Icons.arrow_forward),
                  ),
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
                  child: const Text(
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




