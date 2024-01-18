import 'package:flutter/material.dart';

class Navigation{
  String title;
  String? description;
  String? tabTitle;
  Widget tab;
  bool? selected=false;
  List<Navigation>? children;

  Navigation({required this.title,required this.tab,this.description,this.tabTitle,this.children, this.selected});
}