import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubjectsScreen extends StatefulWidget {
  const SubjectsScreen({super.key});

  @override
  State<SubjectsScreen> createState() => _SubjectsScreenState();
}

class _SubjectsScreenState extends State<SubjectsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('subjects', style: TextStyle(color: Color(0xFF547792), fontWeight: FontWeight.bold,),),
      ),

    );  }
}
