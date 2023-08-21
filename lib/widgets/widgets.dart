import 'package:flutter/material.dart';

mixin TaskWidgets{
   taskAppBar(title){
    return AppBar(
        centerTitle: true,
        title: Text(title,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      );
  }
}