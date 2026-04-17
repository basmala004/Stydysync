import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../wedgits/task_Item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Studysync',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black,) ,
          ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          padding:  EdgeInsets.symmetric(horizontal: h*(25/h)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/bear.png"),

              SizedBox(height: h*0.025),

               Text(
                'Welcome to Studysync!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
               Text(
                'Let’s study together',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF547792),
                ),
              ),

              SizedBox(height: h*0.025),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(
                    'Upcoming tasks',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  Color(0xFF547792),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child:  Text('ADD TASK'),
                  ),
                ],
              ),

              SizedBox(height: h*0.025),

              Container(
                width: w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TaskItem(
                      subject: 'Math',
                      title: 'Complete Calculus Assignment',
                      date: '15/4/2026',
                      h: h,
                    ),
                    TaskItem(
                      subject: 'Chemistry',
                      title: 'Revise Chapter 1',
                      date: '15/4/2026',
                      h: h,
                    ),
                  ]),
              )
              ,SizedBox(height: h*0.025),
            ],
          ),
        ),

    );
  }
}
