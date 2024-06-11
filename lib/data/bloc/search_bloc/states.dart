
import '../../model/data_model.dart';

abstract class SearchState{}
class SInitState extends SearchState{}
class SLoadingState extends SearchState{}
class SLoadedState extends SearchState{
  DataModel mData;
  SLoadedState({required this.mData});
}
class SErrorState extends SearchState{
  String msg;
  SErrorState({required this.msg});
}