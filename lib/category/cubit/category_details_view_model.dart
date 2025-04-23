import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/category/cubit/states.dart';
import 'package:news_app/core/network_helper/api_manager.dart';

class CategoryDetailsViewModel extends Cubit<SourceStates> {
  CategoryDetailsViewModel() : super(SourceLoadingState());

  void getSources(String categoryId) async {
    try {
      emit(SourceLoadingState());
      var response = await ApiManager.getSources(categoryId);

      if (response!.status == 'error') {
        emit(SourceErrorState(errorMessage: response.message));

        return;
      }
      if (response.status == 'ok') {
        emit(SourceSuccessState(sourceList: response.sources!));
        return;
      }
    } catch (e) {
      emit(SourceErrorState(errorMessage: e.toString()));
    }
  }
}
