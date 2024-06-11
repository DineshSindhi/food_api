import 'package:api_project/data/bloc/data_bloc/data_states.dart';
import 'package:api_project/presentation/api_data/api_url.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../presentation/api_data/get_api.dart';
import '../../model/data_model.dart';
import 'data_event.dart';
class DataBloc extends Bloc<REvent,RState>{
  ApiHelper apiHelper;
  DataBloc({required this.apiHelper}):super(rInitState()){
    on<RecipeEvent>((event, emit) async {
      emit(rLoadingState());
      try{
        var mData= await apiHelper.getApiWallpaper(url: GetUrl.API_URL);
        var rawData=DataModel.fromJson(mData);
        emit(rLoadedState(dataModel: rawData));

      }catch(e){
        emit(rErrorState(msg: (e.toString())));
      }
    });
  }
}