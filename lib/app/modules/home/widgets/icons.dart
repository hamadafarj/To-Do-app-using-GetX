import 'package:flutter/material.dart';
import 'package:getx_todo/app/core/values/colors.dart';
import 'package:getx_todo/app/core/values/icons.dart';

List<Icon> getIcons() {
  return const [
    Icon(IconData(personIcon, fontFamily: 'MaterialIcons'),color: purple,),
    Icon(IconData(workIcon, fontFamily: 'MaterialIcons'),color: lightBlue,),
    Icon(IconData(movieIcon, fontFamily: 'MaterialIcons'),color: pink,),
    Icon(IconData(sportIcon, fontFamily: 'MaterialIcons'),color: green,),
    Icon(IconData(travelIcon, fontFamily: 'MaterialIcons'),color: yellow,),
    Icon(IconData(shopIcon, fontFamily: 'MaterialIcons'),color: deepPink,),
  ];
}
