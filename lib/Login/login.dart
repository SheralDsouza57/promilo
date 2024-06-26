import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:promilo/Colors/appcolors.dart';
import 'package:promilo/CustomWidgets/textwidget.dart';
import 'package:promilo/Dashboard/dashboard.dart';
import 'package:promilo/Fonts/fonts.dart';
import 'package:promilo/Images/app_images.dart';
import 'package:promilo/APIService/api_service.dart';
import 'package:promilo/Validators/validators.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isSubmitButtonEnabled = false;

  final ApiService _apiService = ApiService();

  void _validateForm() {
    setState(() {
      _isSubmitButtonEnabled = _formKey.currentState?.validate() ?? false;
    });
  }

  bool _rememberMe = false;
  void _toggleRememberMe(bool? newValue) {
    setState(() {
      _rememberMe = newValue ?? false;
    });
  }

  void _showToast(String message, {Color backgroundColor = AppColors.grey}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: backgroundColor,
      textColor: AppColors.white,
    );
  }

  Future<void> _login() async {
    final String email = _emailController.text;
    final String password = _passwordController.text;
    try {
      final response = await _apiService.login(email, password);

      if (response.statusCode == 200) {
        // Handle successful login
        _showToast('Login Successful!');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Dashboard()),
        );
        // Navigate to another screen or show a success message
      } else {
        // Handle login error
        _showToast('Invalid ID Password');
      }
    } catch (e) {
      _showToast('An error occurred. Please try again.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: _validateForm,
            child: Column(
              children: [
                const SizedBox(height: 40),
                const TextWidget(
                  text: 'promilo',
                  fontsize: 20,
                  fontweight: FontWeight.w500,
                ),
                const SizedBox(height: 50),
                const TextWidget(
                  text: 'Hi, Welcome Back!',
                  fontsize: 20,
                  fontweight: FontWeight.w500,
                ),
                const SizedBox(height: 30),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: TextWidget(
                    text: 'Please Sign in to continue',
                    fontsize: 16,
                    color: AppColors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 70,
                  child: TextFormField(
                    controller: _emailController,
                    validator: Validators.emailValidator,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: 'Enter Email or Mob No.',
                      hintStyle: TextStyle(
                          fontFamily: Fonts.poppins,
                          fontWeight: FontWeight.w300),
                      border: OutlineInputBorder(
                          gapPadding: 0,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide(color: Colors.black, width: 1.5),
                      ),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.centerRight,
                  child: TextWidget(
                    text: 'Sign In With OTP',
                    fontsize: 16,
                    fontweight: FontWeight.w500,
                    color: AppColors.blue,
                  ),
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: TextWidget(
                    text: 'Password',
                    fontsize: 16,
                    color: AppColors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 70,
                  child: TextFormField(
                    controller: _passwordController,
                    validator: Validators.passwordValidator,
                    obscureText: true,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: 'Enter Password',
                      hintStyle: TextStyle(
                          fontFamily: Fonts.poppins,
                          fontWeight: FontWeight.w300),
                      border: OutlineInputBorder(
                          gapPadding: 0,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide(color: Colors.black, width: 1.5),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: _rememberMe,
                          onChanged: _toggleRememberMe,
                        ),
                        InkWell(
                          onTap: () {
                            _toggleRememberMe(!_rememberMe);
                          },
                          child: const TextWidget(
                            text: 'Remember Me',
                            fontsize: 16,
                            color: AppColors.grey,
                            fontweight: FontWeight.w300,
                          ),
                        )
                      ],
                    ),
                    const TextWidget(
                      text: 'Forgot Password',
                      fontsize: 16,
                      fontweight: FontWeight.w500,
                      color: AppColors.blue,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    _isSubmitButtonEnabled == true ? _login() : null;
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        color: _isSubmitButtonEnabled
                            ? AppColors.blue
                            : AppColors.davisGrey,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 2, color: AppColors.blue)),
                    child: const Center(
                      child: TextWidget(
                        text: 'Submit',
                        color: AppColors.white,
                        fontsize: 16,
                        fontweight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Image.asset(Images.line),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(Images.google),
                    const SizedBox(width: 10),
                    Image.asset(Images.linkedin),
                    const SizedBox(width: 10),
                    Image.asset(Images.facebook),
                    const SizedBox(width: 10),
                    Image.asset(Images.instagram),
                    const SizedBox(width: 10),
                    Image.asset(Images.whatsapp),
                  ],
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: 'Business User?',
                      fontsize: 16,
                      color: AppColors.justGrey,
                    ),
                    TextWidget(
                      text: 'Don\'t have an account',
                      fontsize: 16,
                      color: AppColors.justGrey,
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: 'Login Here',
                      fontsize: 16,
                      color: AppColors.blue,
                      fontweight: FontWeight.w500,
                    ),
                    TextWidget(
                      text: 'Sign Up',
                      fontsize: 16,
                      color: AppColors.blue,
                      fontweight: FontWeight.w500,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const TextWidget(
                  text: 'By continuing, you agree to',
                  fontsize: 15,
                  color: AppColors.featherGrey,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(
                      text: 'Promilo\'s ',
                      fontsize: 15,
                      color: AppColors.featherGrey,
                    ),
                    TextWidget(
                      text: 'Terms of Use & Privacy Policy.',
                      fontsize: 15,
                      color: AppColors.black,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
