part of 'home_bloc.dart';

class HomeState extends Equatable {

  final bool isLoading;
  final String errorMessage;
  final List<String> banners;
  final List<CatFactsEntity> catFacts;

  const HomeState({
    this.isLoading = false,
    this.errorMessage = "",
    this.banners = const [],
    this.catFacts = const [],
  });

  HomeState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<String>? banners,
    List<CatFactsEntity>? catFacts,}){
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      banners: banners ?? this.banners,
      catFacts: catFacts ?? this.catFacts,);
  }

  @override
  List<Object?> get props => [isLoading, errorMessage, banners, catFacts];
}
