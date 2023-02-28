import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_authentication/models/categoria.dart';
import 'package:flutter_bloc_authentication/repositories/category_repository.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository categoryRepository;
  CategoryBloc(this.categoryRepository) : super(CategoryInitial()) {
    on<FetchAllCategory>(_categoryFetched);
  }

  void _categoryFetched(
      FetchAllCategory event, Emitter<CategoryState> emit) async {
    try {
      final categorias = await categoryRepository.fetchAllCategory();
      emit(CategoryFetched(categorias.content));
      return;
    } on Exception catch (e) {
      emit(CategoryFetchError(e.toString()));
    }
  }
}
