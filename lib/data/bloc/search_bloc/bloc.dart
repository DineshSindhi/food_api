import 'package:api_project/data/bloc/search_bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../presentation/api_data/api_url.dart';
import '../../../presentation/api_data/get_api.dart';
import '../../model/data_model.dart';
import 'event.dart';
class SearchBloc extends Bloc<SearchRecipe,SearchState>{
  ApiHelper apiHelper;
  SearchBloc({required this.apiHelper}):super(SInitState()){
    on<SearchRecipe>((event, emit) async {
      emit(SLoadingState());
      try{
        var mData= await apiHelper.getApiWallpaper(url: '${GetUrl.SEARCH_URL}${event.query}');
        var rawData=DataModel.fromJson(mData);
        emit(SLoadedState(mData: rawData));

      }catch(e){
        emit(SErrorState(msg: (e.toString())));
      }
    });
  }
}