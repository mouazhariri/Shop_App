import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appp/Layout/shop_app/shop_Layout.dart';

import 'package:flutter_appp/modules/shop_app/on_boarding/login/register/cubit/cubit.dart';
import 'package:flutter_appp/modules/shop_app/on_boarding/login/register/cubit/states.dart';
import 'package:flutter_appp/shared/Network/Local/cache_helper.dart';

import 'package:flutter_appp/shared/components/components.dart';
import 'package:flutter_appp/shared/components/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class ShopRegisterScreen extends StatelessWidget {
//   var formkey = GlobalKey<FormState>();
//   var nameController = TextEditingController();
//   var emailController = TextEditingController();
//   var passwordController = TextEditingController();
//   var phoneController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context) => ShopRegisterCubit(),
//       child: BlocConsumer<ShopRegisterCubit, ShopRegisterStates>(
//           listener: (context, state) {
//         if (state is ShopRegisterSuccessStats) {
//           if (state.loginModel.status) {
//             print(state.loginModel.message);
//             print(state.loginModel.data.token);
//
//             CacheHelper.saveData(
//                     key: 'token', value: state.loginModel.data.token)
//                 .then((value) {
//               token = state.loginModel.data.token;
//               navigateToAndFinish(context, ShopLayout());
//             });
//           } else {
//             print(state.loginModel.message);
//             showToast(
//                 message: state.loginModel.message, state: toastState.Error);
//           }
//         }
//       }, builder: (context, state) {
//         return Scaffold(
//           appBar: AppBar(),
//           body: Center(
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Form(
//                   key: formkey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'REGISTER',
//                         style: Theme.of(context)
//                             .textTheme
//                             .headline5
//                             .copyWith(color: Colors.black),
//                         // TextStyle(
//                         //   color: Colors.black,
//                         //   fontSize: 40.0,
//                         //   fontWeight: FontWeight.w700,
//                         // ),
//                       ),
//                       SizedBox(
//                         height: 15.0,
//                       ),
//                       Text(
//                         'REGISTER Now to can SignIn the Store',
//                         style: Theme.of(context)
//                             .textTheme
//                             .bodyText2
//                             .copyWith(color: Colors.grey),
//                       ),
//                       SizedBox(
//                         height: 40.0,
//                       ),
//                       defaulttextformfield(
//                           controller: nameController,
//                           type: TextInputType.name,
//                           validator: (value) {
//                             if (value.isEmpty) {
//                               return 'please enter your name';
//                             }
//                             return null;
//                           },
//                           label: 'User Name',
//                           prefix: Icons.person),
//                       SizedBox(
//                         height: 15.0,
//                       ),
//                       defaulttextformfield(
//                           controller: emailController,
//                           type: TextInputType.emailAddress,
//                           validator: (value) {
//                             if (value.isEmpty) {
//                               return 'email must be not empty';
//                             }
//                             return null;
//                           },
//                           label: 'Email Address',
//                           prefix: Icons.email_outlined),
//                       SizedBox(
//                         height: 15.0,
//                       ),
//                       defaulttextformfield(
//                           controller: passwordController,
//                           ispasswoard:
//                               ShopRegisterCubit.get(context).isPassword,
//                           suffix: ShopRegisterCubit.get(context).suffix,
//                           suffixpressed: () {
//                             ShopRegisterCubit.get(context)
//                                 .changeVisibilityPassword();
//                           },
//                           type: TextInputType.visiblePassword,
//                           validator: (value) {
//                             if (value.isEmpty) {
//                               return 'password must be not empty';
//                             }
//                             return null;
//                           },
//                           label: 'Password',
//                           prefix: Icons.lock_outline_rounded),
//                       SizedBox(
//                         height: 15,
//                       ),
//                       defaulttextformfield(
//                           controller: phoneController,
//                           type: TextInputType.phone,
//                           validator: (value) {
//                             if (value.isEmpty) {
//                               return 'please enter your phone number';
//                             }
//                             return null;
//                           },
//                           label: 'Phone number',
//                           prefix: Icons.phone),
//                       SizedBox(
//                         height: 30.0,
//                       ),
//                       ConditionalBuilder(
//                         condition: state is! ShopRegisterLoadingStats,
//                         builder: (context) => defaultbutton(
//                             function: () {
//                               if (formkey.currentState.validate()) {
//                                 ShopRegisterCubit.get(context).userRegister(
//                                     name: nameController.text,
//                                     email: emailController.text,
//                                     password: passwordController.text,
//                                     phone: phoneController.text);
//                               }
//                             },
//                             text: 'REGISTER'),
//                         fallback: (context) =>
//                             Center(child: CircularProgressIndicator()),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       }),
//     );
//   }
// }
class ShopRegisterScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit, ShopRegisterStates>(
        listener: (context, state) {
          if (state is ShopRegisterSuccessStats) {
            if (state.loginModel.status) {
              print(state.loginModel.message);
              print(state.loginModel.data.token);

              CacheHelper.saveData(
                key: 'token',
                value: state.loginModel.data.token,
              ).then((value) {
                token = state.loginModel.data.token;

                navigateToAndFinish(
                  context,
                  ShopLayout(),
                );
              });
            } else {
              print(state.loginModel.message);

              showToast(
                message: state.loginModel.message,
                state: toastState.Error,
              );
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
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'REGISTER',
                          style: Theme.of(context).textTheme.headline4.copyWith(
                                color: Colors.black,
                              ),
                        ),
                        Text(
                          'Register now to browse our hot offers',
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                color: Colors.grey,
                              ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        defaulttextformfield(
                          controller: nameController,
                          type: TextInputType.name,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'please enter your name';
                            }
                            return null;
                          },
                          label: 'User Name',
                          prefix: Icons.person,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaulttextformfield(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'please enter your email address';
                            }
                            return null;
                          },
                          label: 'Email Address',
                          prefix: Icons.email_outlined,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaulttextformfield(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          suffix: ShopRegisterCubit.get(context).suffix,
                          onSubmitted: (value) {},
                          ispasswoard:
                              ShopRegisterCubit.get(context).isPassword,
                          suffixpressed: () {
                            ShopRegisterCubit.get(context)
                                .changePasswordVisibility();
                          },
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'password is too short';
                            }
                            return null;
                          },
                          label: 'Password',
                          prefix: Icons.lock_outline,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaulttextformfield(
                          controller: phoneController,
                          type: TextInputType.phone,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'please enter your phone number';
                            }
                            return null;
                          },
                          label: 'Phone',
                          prefix: Icons.phone,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! ShopRegisterLoadingStats,
                          builder: (context) => defaultbutton(
                            function: () {
                              if (formKey.currentState.validate()) {
                                ShopRegisterCubit.get(context).userRegister(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  phone: phoneController.text,
                                );
                              }
                            },
                            text: 'register',
                            isUppercase: true,
                          ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
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
