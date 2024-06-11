import 'package:api_project/data/model/recipe_model.dart';

class DataModel {
  int? limit;
  int? skip;
  int? total;
  List<RecipesModel>? recipes;

  DataModel(
      {required this.limit,
      required this.skip,
      required this.total,
      required this.recipes});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    List<RecipesModel>mData=[];
    for(Map<String,dynamic>eachData in json['recipes']){
      mData.add(RecipesModel.fromJson(eachData));
    }
    return DataModel(
        limit: json['limit'], skip: json['skip'], total: json['total'], recipes: mData);
  }
}
