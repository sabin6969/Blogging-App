import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvc_app/constants/route_names.dart';
import 'package:mvc_app/controller/login_controller.dart';
import 'package:mvc_app/utils/custom_text_button.dart';
import 'package:mvc_app/utils/custom_text_form_field.dart';
import 'package:mvc_app/utils/label_text.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginController _loginController = LoginController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final ValueNotifier<bool> _isPasswordVissible = ValueNotifier(true);

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    final loginController = Provider.of<LoginController>(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.grey,
          ),
          Padding(
            padding: EdgeInsets.only(top: 100.h),
            child: Container(
              height: size.height * 1 - 100.h,
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    25.h,
                  ),
                  topRight: Radius.circular(
                    25.h,
                  ),
                ),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Form(
                    key: _globalKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 24.h,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: LabelText(
                            data: "Welcome Back",
                            fontSize: 28.h,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        CustomTextFormField(
                          currentNode: _emailFocusNode,
                          nextNode: _passwordFocusNode,
                          textInputType: TextInputType.emailAddress,
                          validator: (value) => _loginController.validateEmail(
                            _emailController.text,
                          ),
                          labelText: "Enter email",
                          isObsecure: false,
                          prefixIconData: Icons.email,
                          textEditingController: _emailController,
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        ValueListenableBuilder(
                          valueListenable: _isPasswordVissible,
                          builder: (context, value, child) {
                            return CustomTextFormField(
                              currentNode: _passwordFocusNode,
                              textInputType: TextInputType.visiblePassword,
                              validator: (value) =>
                                  _loginController.validatePassword(
                                _passwordController.text,
                              ),
                              labelText: "Enter Password",
                              isObsecure: value,
                              prefixIconData: Icons.lock,
                              textEditingController: _passwordController,
                              suffixIconButton: value
                                  ? IconButton(
                                      onPressed: () {
                                        _isPasswordVissible.value =
                                            !_isPasswordVissible.value;
                                      },
                                      icon: const Icon(
                                        Icons.visibility,
                                      ))
                                  : IconButton(
                                      onPressed: () {
                                        _isPasswordVissible.value =
                                            !_isPasswordVissible.value;
                                      },
                                      icon: const Icon(
                                        Icons.visibility_off,
                                      ),
                                    ),
                            );
                          },
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: CustomTextButton(
                            name: "Forgot password?",
                            onPressed: () {},
                            fontSize: 14.h,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Consumer<LoginController>(
                          builder: (context, value, child) {
                            return OutlinedButton(
                              onPressed: loginController.getisLoading
                                  ? null
                                  : () {
                                      loginController.login(
                                        loginDetails: {
                                          "email": _emailController.text,
                                          "password": _passwordController.text,
                                        },
                                        globalKey: _globalKey,
                                      );
                                    },
                              child: loginController.getisLoading
                                  ? const CircularProgressIndicator()
                                  : const Text(
                                      "Login",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            LabelText(
                              data: "Don't have an account?",
                              fontSize: 14.h,
                              fontWeight: FontWeight.w500,
                            ),
                            CustomTextButton(
                              name: "Create account",
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  RouteName.signupPage,
                                );
                              },
                              fontSize: 14.h,
                              fontWeight: FontWeight.w500,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
