import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        // title: Text(
        //     'Studysync',
        //     style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black,) ,
        //   textAlign: TextAlign.center,),
      ),
      body: SingleChildScrollView(
          padding:  EdgeInsets.symmetric(horizontal: 24.0),
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
                _buildTaskItem('Math', 'Complete Calculus Assignment', '15/4/2026', h,w),
                _buildTaskItem('Chemistry', 'Revise Chapter 1', '15/4/2026',h, w),
                _buildTaskItem('Physics', 'Lab Report', '16/4/2026',h,w),
                ]),
              )
              ,SizedBox(height: h*0.025),
            ],
          ),
        ),

    );
  }

  // Helper widget to build each task row
  Widget _buildTaskItem(String subject, String title, String date, double h, double w) {
    return Padding(
      padding: EdgeInsets.only(bottom: h*(20/h)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subject,
            style:  TextStyle(
              fontSize: 16,
              color: Color(0xFF547792),
            ),
          ),
          SizedBox(height: h*0.0005),
          Text(
            title,
            style:  TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: h*0.0005),
          Text(
            'Due: $date',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
