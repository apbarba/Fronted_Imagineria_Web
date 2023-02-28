part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable{
  const CategoryEvent();

  @override
  List<Object> get props => [];
  
}

class FetchAllCategory extends CategoryEvent {

  const FetchAllCategory();

  @override
  List<Object> get props => [];
}