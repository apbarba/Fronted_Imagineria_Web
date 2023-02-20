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
  final ObrasModel obrasModel;

  ObrasLoaded(this.obrasModel);

  @override
  List<Object> get props => [obrasModel];
}

class ObrasError extends ObrasState {
  final String error;

  const ObrasError(this.error);

  @override
  List<Object> get props => [error];
}