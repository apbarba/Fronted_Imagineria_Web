import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class ObrasState extends Equatable {
  @override
  List<Object> get props => [];
}

class ObrasInitial extends ObrasState {}

class ObrasLoading extends ObrasState {}

class ObrasSuccess extends ObrasState {}

class ObrasError extends ObrasState {
  late final String error;

  ObrasError({required this.error});

  @override
  List<Object> get props => [error];
}
