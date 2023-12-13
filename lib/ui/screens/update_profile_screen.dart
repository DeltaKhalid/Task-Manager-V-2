import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_managet/ui/widgets/screen_background.dart';
import 'package:task_managet/ui/widgets/user_profile_banner.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {

  /// Form Validation
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();

  /// Image Picker variables and Instance
  XFile? imageFile;
  ImagePicker picker = ImagePicker();




  final TextEditingController _emailTEController = TextEditingController();			///*** Add all controllers
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _productTotalPriceTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              UserProfileBanner(
                isUpdateScreen: true,
              ),
              const SizedBox(height: 24,),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Update Profile',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    const SizedBox(height: 16,),
                    InkWell(
                      onTap: (){
                        selectImage();                                          /// new for Upload image
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(14),
                              color: Colors.grey,
                              child: const Text('Photos', style: TextStyle(
                                color: Colors.white,
                              ),),
                            ),
                            const SizedBox(width: 16,),
                            Visibility(
                              visible: imageFile != null,                       /// new add for upLoad Image
                              child: Text(imageFile?.name ?? ''),               /// new add for upLoad Image
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16,),
                    TextFormField(
                      controller: _emailTEController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                      ),
                      validator: ( String? value){
                        if (value?.trim().isEmpty ?? true){
                          return 'Enter Your Email Address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12,),
                    TextFormField(
                      controller: _firstNameTEController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        hintText: 'First Name',
                      ),
                      validator: ( String? value){
                        if (value?.trim().isEmpty ?? true){
                          return 'Enter Your First Name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16,),
                    TextFormField(
                      controller: _lastNameTEController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        hintText: 'Last Name',
                      ),
                      validator: ( String? value){
                        if (value?.trim().isEmpty ?? true){
                          return 'Enter Your Last Name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12,),
                    TextFormField(
                      controller: _mobileTEController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        hintText: 'Mobile',
                      ),
                      validator: ( String? value){
                        if ((value?.trim().isEmpty ?? true) || value!.length  < 11){
                          return 'Enter Your valid Mobile Number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12,),
                    TextFormField(
                      controller: _passwordTEController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                      ),
                      validator: ( String? value){
                        if ((value?.trim().isEmpty ?? true) || value!.length  <= 5){
                          return 'Enter Your password more then 6 letters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30,),
                    SizedBox(
                      width: double.infinity,
                        child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Update'),
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///======================================== Image Picker Plugin Use Function ============================================================///
  void selectImage() {
    //ImagePicker picker = ImagePicker();
    picker.pickImage(source: ImageSource.gallery).then((xFile) {
      if (xFile != null){
        imageFile = xFile;
        if (mounted) {
          setState(() {});
        }
      }
    });
  }


}
