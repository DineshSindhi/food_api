import 'package:api_project/data/model/data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailPage extends StatelessWidget {
  int mIndex;
  DataModel model;
   DetailPage({required this.mIndex,required this.model});

  @override
  Widget build(BuildContext context) {
    var data=model.recipes![mIndex];
    return Scaffold(
      appBar: AppBar(title: Text('Food Recipe Detail '),centerTitle: true,backgroundColor: Colors.orange,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
            Hero(
              tag: "$mIndex",
              child: Container(
              width: double.infinity,
              margin: EdgeInsets.all(2),
              height: 350,
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                  image: DecorationImage(
                      image: NetworkImage('${data.image}'),fit: BoxFit.fill
                  )
              ),),
            ),
            Text('${data.name}',style: TextStyle(fontSize: 30),),
          Container(width: double.infinity,height: 5,color: Colors.grey,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text('Cuisine - ${data.cuisine}',style: TextStyle(fontSize: 22),),
                Text('Difficulty - ${data.difficulty}',style: TextStyle(fontSize: 22),)
              ],),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.star,size: 30,color: Colors.yellow.shade500,),
                        Text('  ${data.rating}',style: TextStyle(color: Colors.white,fontSize: 20),)
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Row(
                      children: [
                        Text('ReviewCount -  ${data.reviewCount}',style: TextStyle(color: Colors.white,fontSize: 20),)
                      ],
                    ),
                  ),
                ),
              ],),
              Container(width: double.infinity,height: 35,color: Colors.orange,
              child: Center(child: Text("Ingredients",style: TextStyle(fontSize: 25))),
              ),
              SizedBox(
                height: 280,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: data.ingredients!.length,
                  itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(data.ingredients![index],style: TextStyle(fontSize: 22),),
                    ],
                  );
                },),
              ),
              Container(width: double.infinity,height: 35,color: Colors.orange,
                child: Center(child: Text("Instructions",style: TextStyle(fontSize: 25))),
              ),
              //
              SizedBox(
                height: 400,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: data.instructions!.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Text(data.instructions![index],style: TextStyle(fontSize: 22),textAlign: TextAlign.center,),
                      ],
                    );
                  },),
              ),
          ],),
        ),
      ),
    );
  }
}
