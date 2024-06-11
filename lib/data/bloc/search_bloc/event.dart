abstract class SearchEvent{}
class SearchRecipe extends SearchEvent{
  String query;
  SearchRecipe({required this.query,});
}