import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stydysync/data/repo.dart';
import 'package:stydysync/wedgits/task_item_common.dart';

import '../wedgits/task_Item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final repo = DataRepository();

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    final upcomingTasks = repo.allTasks.where((t) => !t.isDone).toList();    return Scaffold(
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
              Image.asset("assets/welcome.png"),

              SizedBox(height: h*0.005),

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
                  color: Color(0xFF4E8D9C),
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

                ],
              ),

              SizedBox(height: h*0.025),

          SizedBox(
            width: w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: upcomingTasks.isEmpty
                  ? [const Center(child: Text("No upcoming tasks!"))]
                  : upcomingTasks.map((task) => TaskItemCommon(
                subject: task.subjectName,
                title: task.title,
                date: task.date,
                isCompleted: task.isDone,
                onChanged: (val) {
                  setState(() {
                    task.isDone = val!;
                  });
                },
              )).toList(),
            ),
          ),
              SizedBox(height: h*0.025),
            ],
          ),
        ),

    );
  }
}
