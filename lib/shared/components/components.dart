import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appp/Layout/shop_app/cubit/cubit.dart';

import 'package:flutter_appp/shared/styles/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget defaultbutton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUppercase = true,
  double radius = 30.0,
  @required Function function,
  @required String text,
}) =>
    Container(
      width: width,
      height: 40.0,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUppercase ? text.toUpperCase() : text,
          style: TextStyle(color: Colors.white),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );
//////////////////////////
Widget defaultTextButton({
  @required Function function,
  @required String text,
}) =>
    TextButton(
      onPressed: function,
      child: Text(
        text.toUpperCase(),
      ),
    );
//////////////////////////////

Widget defaulttextformfield({
  @required TextEditingController controller,
  @required TextInputType type,
  Function onSubmitted,
  ValueChanged onChanged,
  bool ispasswoard = false,
  @required Function validator,
  Function() onTap,
  bool isClickable = true,
  @required String label,
  @required IconData prefix,
  IconData suffix,
  Function() suffixpressed,
}) =>

//space text ready
    TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onSubmitted,
      onChanged: onChanged,
      obscureText: ispasswoard,
      onTap: onTap,
      enabled: isClickable,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(
                icon: Icon(suffix),
                onPressed: suffixpressed,
              )
            : null,
        border: OutlineInputBorder(),
      ),
    );

//circle avatar

//
// Widget tasksBuilder({@required List<Map> tasks}) => Center(
//       child: ConditionalBuilder(
//         condition: tasks.length > 0,
//         builder: (context) => ListView.separated(
//             itemBuilder: (context, index) =>
//                 buildTaskItem(tasks[index], context),
//             separatorBuilder: (context, index) => myDivider(),
//             itemCount: tasks.length),
//         fallback: (context) => Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.wb_cloudy,
//               color: Colors.grey,
//               size: 100.0,
//             ),
//             Text(
//               'No Tasks Yet ,Please Add some tasks',
//               style: TextStyle(
//                   color: Colors.black12,
//                   fontSize: 15,
//                   fontWeight: FontWeight.bold),
//             )
//           ],
//         ),
//       ),
//     );

//space item
Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(start: 20.0),
      child: Container(
        width: double.infinity,
        height: 1,
        color: Colors.grey[200],
      ),
    );

//push to next page
void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
//push and finish
void navigateToAndFinish(
  context,
  widget,
) =>
    Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context) => widget), (route) {
      return false;
    });

void showToast({
  @required String message,
  @required toastState state,
}) =>
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: choseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);
//enum
enum toastState { Success, Error, Warning }
Color choseToastColor(toastState state) {
  Color color;
  switch (state) {
    case toastState.Success:
      color = Colors.green;
      break;
    case toastState.Error:
      color = Colors.red;
      break;
    case toastState.Warning:
      color = Colors.amber;
      break;
  }
  return color;
}

/////////////////////////
Widget buildListProduct(
  model,
  context, {
  bool isOldPrice = true,
}) =>
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 120.0,
        child: Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage(model.image),
                  width: 120.0,
                  height: 120.0,
                ),
                if (model.discount != 0 && isOldPrice)
                  Container(
                    color: Colors.red,
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.0,
                    ),
                    child: Text(
                      'DISCOUNT',
                      style: TextStyle(
                        fontSize: 8.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.0,
                      height: 1.3,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        model.price.toString(),
                        style: TextStyle(
                          fontSize: 12.0,
                          color: defaultColor,
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      if (model.discount != 0 && isOldPrice)
                        Text(
                          model.oldPrice.toString(),
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          ShopCubit.get(context).changeFavorites(model.id);
                        },
                        icon: CircleAvatar(
                          radius: 15.0,
                          backgroundColor:
                              ShopCubit.get(context).favorites[model.id]
                                  ? defaultColor
                                  : Colors.grey,
                          child: Icon(
                            Icons.favorite_border,
                            size: 14.0,
                            color: Colors.white,
                          ),
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
    );
