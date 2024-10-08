import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_cat_fact_app/core/common/api_result.dart';
import 'package:flutter_cat_fact_app/core/domain/usecase/get_cat_fact_api_use_case.dart';
import 'package:flutter_cat_fact_app/core/entity/cat_facts_entity.dart';
import 'package:logger/logger.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  final GetCatFactApiUseCase _catFactApiUseCase;

  HomeBloc(this._catFactApiUseCase) : super(const HomeInitial()) {

    on<GetCatFactsEvent>(_getCatFacts);
  }

  Future<void> _getCatFacts(GetCatFactsEvent event, Emitter<HomeState> emit) async {

    if(state is HomeApiFailed) {
      emit(const HomeInitial());
    }

    final apiResult = await _catFactApiUseCase.execute();

    switch(apiResult) {
      case ApiSuccess() : {
        Logger().e("success");
        emit(HomeApiSuccess(banners: bannerList, catFacts: apiResult.data));
      }
      case ApiError() : {
        Logger().e("failed");
        emit(HomeApiFailed(errorMessage: apiResult.errorMessage));
      }
    }

  }

  final bannerList = [
    "https://static.vecteezy.com/system/resources/previews/027/957/580/non_2x/cute-card-with-cat-free-photo.jpg",
    "https://static.vecteezy.com/system/resources/previews/012/098/088/non_2x/banner-background-cute-cats-say-hello-free-vector.jpg",
    "https://static.vecteezy.com/system/resources/previews/035/381/164/non_2x/ai-generated-a-tabby-cat-looks-up-into-the-sun-free-photo.jpg",
    "https://static.vecteezy.com/system/resources/previews/024/705/172/non_2x/empty-space-background-with-cat-illustration-ai-generative-free-photo.jpg",
    "https://static.vecteezy.com/system/resources/thumbnails/038/954/317/small_2x/ai-generated-stylish-white-cat-with-sunglasses-and-bow-tie-posing-on-a-pink-background-ample-copy-space-on-the-side-photo.jpeg"
  ];

}
