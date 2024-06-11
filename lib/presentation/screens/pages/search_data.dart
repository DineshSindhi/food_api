
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/bloc/search_bloc/bloc.dart';
import '../../../data/bloc/search_bloc/event.dart';
import '../../../data/bloc/search_bloc/states.dart';
import '../../api_data/get_api.dart';
import 'detail_page.dart';

class SearchData extends StatefulWidget {
  String query;
  SearchData({required this.query});
  @override
  State<SearchData> createState() => _HomePageState();
}

class _HomePageState extends State<SearchData> {
  var searchController=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<SearchBloc>().add(SearchRecipe(query: '${widget.query}'));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Food Recipe '),centerTitle: true,backgroundColor: Colors.orange,),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                  filled: true,
                  hintText: 'Search',
                  suffixIcon: InkWell(
                      onTap: (){
                        if(searchController.text.isNotEmpty){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => BlocProvider(
                              create: (context) => SearchBloc(apiHelper: ApiHelper()),
                              child: SearchData( query: '${searchController.text}',)),));
                        }
                      },
                      child: Icon(Icons.search,size: 30,)),

                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20)
                  )
              ),),
          ),
          Expanded(
            child: BlocBuilder<SearchBloc,SearchState>(
              builder: (_, state) {
                if(state is SLoadingState){
                  return Center(child: CircularProgressIndicator(),);
                }else if(state is SErrorState) {
                  return Center(child: Text('${state.msg}'),);
                }else if(state is SLoadedState){
                  return state.mData.recipes!.isNotEmpty?ListView.builder(
                    itemCount: state.mData.recipes!.length,
                    itemBuilder: (context, index) {
                      var data=state.mData.recipes![index];
                      return InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(mIndex: index,model:state.mData ,),));
                        },
                        child: Hero(
                          tag: '$index',
                          child: Container(
                            width: double.infinity,
                            height: 410,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(20),),
                            child: Column(
                              children: [
                                Container(
                                    width: double.infinity,
                                    height: 350,
                                    decoration: BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                                        image: DecorationImage(
                                            image: NetworkImage('${data.image}'),fit: BoxFit.fill
                                        )
                                    ),
                                    child: Row(crossAxisAlignment: CrossAxisAlignment.end,children: [
                                      Row(
                                        children: [
                                          Icon(Icons.star,size: 30,color: Colors.yellow.shade500,),
                                          Text('  ${data.rating}',style: TextStyle(color: Colors.white,fontSize: 20),)
                                        ],
                                      ),
                                    ],)
                                ),
                                Center(child: Text('${data.name}',style: TextStyle(color: Colors.white,fontSize: 30),maxLines: 1,overflow: TextOverflow.clip,textAlign: TextAlign.center,),),
                              ],
                            ),
                          ),
                        ),
                      );
                    },):Center(child: Text('No Recipe'),);
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}