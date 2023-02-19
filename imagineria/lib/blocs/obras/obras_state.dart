import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc_authentication/models/models.dart';

abstract class ObrasState extends Equatable{}

class ObrasLoadingState extends ObrasState{

  @override
  List<Object?> get props => [];
}

class ObrasLoadedState extends ObrasState{

  ObrasLoadedState(this.obras);

  final List<ObrasModel> obras;

  @override
  List<Object?> get props => [obras];
}

class ObrasErrorState extends ObrasState{

  ObrasErrorState(this.error);

  final String error;

  @override
  List<Object?> get props => [error];
}