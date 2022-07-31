import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appp/Layout/shop_app/cubit/cubit.dart';
import 'package:flutter_appp/Layout/shop_app/cubit/states.dart';
import 'package:flutter_appp/modules/shop_app/on_boarding/login/shop_login_screen.dart';
import 'package:flutter_appp/modules/shop_app/on_boarding/search/Search_Screen.dart';
import 'package:flutter_appp/shared/Network/Local/cache_helper.dart';
import 'package:flutter_appp/shared/components/components.dart';
import 'package:flutter_appp/shared/components/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Center(child: Text('shoppmon')),
            actions: [
              IconButton(
                  onPressed: () {
                    navigateTo(context, ShopSearchScreen());
                  },
                  icon: Icon(Icons.search)),
            ],
          ),
          body: cubit.homeModel == null
              ? Center(child: CircularProgressIndicator())
              : cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              cubit.changeBottom(index);
            },
            currentIndex: cubit.currentIndex,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.apps_rounded), label: 'Categories'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'Favorite'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings'),
            ],
          ),
        );
      },
    );
  }
}
