import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appp/Layout/shop_app/shop_Layout.dart';
import 'package:flutter_appp/shared/components/constants.dart';
import '../../../../Layout/shop_app/cubit/cubit.dart';
import '../../../../models/shop_model/logn_model.dart';
import 'package:flutter_appp/modules/shop_app/on_boarding/login/cubit/cubit.dart';
import 'package:flutter_appp/modules/shop_app/on_boarding/login/cubit/states.dart';
import 'package:flutter_appp/modules/shop_app/on_boarding/login/register/register.dart';
import 'package:flutter_appp/shared/Network/Local/cache_helper.dart';
import 'package:flutter_appp/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShopLoginScreen extends StatelessWidget {
  var formkey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
        listener: (context, state) {
          if (state is ShopLoginSuccessStats) {
            if (state.loginModel.status) {
              print(state.loginModel.message);
              print(state.loginModel.data.token);
              showToast(
                message: state.loginModel.message,
                state: toastState.Success,
              );

              CacheHelper.saveData(
                      key: 'token', value: state.loginModel.data.token)
                  .then((value) {
                token = state.loginModel.data.token;
                navigateToAndFinish(context, ShopLayout());
              });
            } else {
              print(state.loginModel.message);
              showToast(
                  message: state.loginModel.message, state: toastState.Error);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOGIN',
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(color: Colors.black),
                          // TextStyle(
                          //   color: Colors.black,
                          //   fontSize: 40.0,
                          //   fontWeight: FontWeight.w700,
                          // ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'Login Now to browser our hot offers',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .copyWith(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        defaulttextformfield(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'email must be not empty';
                              }
                              return null;
                            },
                            label: 'Email Address',
                            prefix: Icons.email_outlined),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaulttextformfield(
                            controller: passwordController,
                            ispasswoard: ShopLoginCubit.get(context).isPassword,
                            suffix: ShopLoginCubit.get(context).suffix,
                            suffixpressed: () {
                              ShopLoginCubit.get(context)
                                  .changeVisibilityPassword();
                            },
                            type: TextInputType.visiblePassword,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'password must be not empty';
                              }
                              return null;
                            },
                            label: 'Password',
                            prefix: Icons.lock_outline_rounded),
                        SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! ShopLoginLoadingStats,
                          builder: (context) => defaultbutton(
                              function: () {
                                if (formkey.currentState.validate()) {
                                  ShopLoginCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text);
                                }
                              },
                              text: 'LOGIN'),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Don\'t have an account?'),
                            SizedBox(
                              width: 5,
                            ),
                            TextButton(
                                onPressed: () {
                                  navigateTo(context, ShopRegisterScreen());
                                },
                                child: Text(
                                  'ReGiSTeR',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
