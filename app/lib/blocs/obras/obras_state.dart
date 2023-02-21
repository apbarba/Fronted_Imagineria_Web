import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_authentication/models/obras.dart';

abstract class ObrasState extends Equatable {
  const ObrasState();

  @override
  List<Object> get props => [];
}

class ObrasInitial extends ObrasState {}

class ObrasSuccess extends ObrasState {
  final ObrasModel obras;

  const ObrasSuccess(this.obras);

  @override
  List<Object> get props => [obras];
}

class ObrasError extends ObrasState {
  final String mensage;

  const ObrasError(this.mensage);

  @override
  List<Object> get props => [mensage];
}
