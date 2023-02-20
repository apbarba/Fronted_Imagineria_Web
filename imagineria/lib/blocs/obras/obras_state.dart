import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_authentication/models/models.dart';

abstract class ObrasState extends Equatable {
  const ObrasState();

  @override
  List<Object?> get props => [];
}

class ObrasInitial extends ObrasState {}

class ObrasLoading extends ObrasState {}

class ObrasLoaded extends ObrasState {
  final List<ObrasModel> obras;

  ObrasLoaded({required this.obras});

  @override
  List<Object> get props => [obras];
}

class ObrasError extends ObrasState {
  final String error;

  ObrasError({required this.error});

  @override
  List<Object> get props => [error];
}
