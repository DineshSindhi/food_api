
import 'dart:async';

import 'package:api_project/presentation/screens/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/bloc/data_bloc/data_bloc.dart';
import '../../api_data/get_api.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BlocProvider(
        create: (context) => DataBloc(apiHelper: ApiHelper()),child: HomePage(),
      ),));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Are You Foodie',style: TextStyle(fontSize: 35 ,),),
          Container(
          width: double.infinity,
          margin: EdgeInsets.all(10),
          height: 400,
          decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: AssetImage('assets/images/food.jpg'),fit: BoxFit.fill
              )
          ),)
          ],
        ),
      ),
    );
  }
}
