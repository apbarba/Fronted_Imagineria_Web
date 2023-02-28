part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryFetched extends CategoryState {
  final List<Categoria> categorias;

  const CategoryFetched(this.categorias);

  @override
  List<Object> get props => [categorias];
}

class CategoryFetchError extends CategoryState {
  final String message;
  const CategoryFetchError(this.message);

  @override
  List<Object> get props => [message];
}
