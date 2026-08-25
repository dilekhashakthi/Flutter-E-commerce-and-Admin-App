import 'package:e_commerce_app/consts/validator.dart';
import 'package:e_commerce_app/widgests/app_name_text.dart';
import 'package:e_commerce_app/widgests/auth/google_btn.dart';
import 'package:e_commerce_app/widgests/subtitle_text.dart';
import 'package:e_commerce_app/widgests/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class LoginScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocusNode;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    // Focus Node
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    if (mounted) {
      _emailController.dispose();
      _passwordController.dispose();

      // Focus Node
      _emailFocusNode.dispose();
      _passwordFocusNode.dispose();
    }
    super.dispose();
  }

  Future<void> _loginFct() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 60),
                AppNameTextWidget(),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TitleTextWidget(label: "Welcome back!", fontSize: 20),
                ),
                SizedBox(height: 16),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: _emailController,
                        focusNode: _emailFocusNode,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "Email Address",
                          prefixIcon: Icon(IconlyLight.message),
                        ),
                        onFieldSubmitted: (value) {
                          FocusScope.of(context)
                              .requestFocus(_passwordFocusNode);
                        },
                        validator: (value) {
                          return Validators.emailValidator(value);
                        },
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _passwordController,
                        focusNode: _passwordFocusNode,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(IconlyLight.lock),
                        ),
                        onFieldSubmitted: (value) async {
                          await _loginFct();
                        },
                        validator: (value) {
                          return Validators.passwordValidator(value);
                        },
                      ),
                      SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: SubtitleTextWidget(
                            label: "Forgot password ?",
                            fontStyle: FontStyle.italic,
                            textDecoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(18),
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          icon: Icon(IconlyLight.login),
                          label: Text("Login"),
                          onPressed: () async {
                            await _loginFct();
                          },
                        ),
                      ),
                      SizedBox(height: 30),
                      SubtitleTextWidget(
                        label: "Or connect using".toUpperCase(),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        height: kBottomNavigationBarHeight + 10,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: SizedBox(
                                height: kBottomNavigationBarHeight,
                                child: FittedBox(child: GoogleButton()),
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: SizedBox(
                                height: kBottomNavigationBarHeight,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 3,
                                    padding: EdgeInsets.all(18),
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: Text(
                                    "Guest?",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                  onPressed: () async {},
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 26),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SubtitleTextWidget(label: "Don't have an account?"),
                          TextButton(
                            onPressed: () {},
                            child: SubtitleTextWidget(
                              label: "SignUp",
                              fontStyle: FontStyle.italic,
                              textDecoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
