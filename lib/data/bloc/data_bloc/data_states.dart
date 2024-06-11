import '../../model/data_model.dart';

abstract class RState{}
class rInitState extends RState{}
class rLoadingState extends RState{}
class rLoadedState extends RState{
  DataModel dataModel;
  rLoadedState({required this.dataModel});
}
class rErrorState extends RState{
  String msg;
  rErrorState({required this.msg});
}
