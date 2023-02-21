import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class RegisterState extends Equatable {
  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterError extends RegisterState {
  late final String error;

  RegisterError({required this.error});

  @override
  List<Object> get props => [error];
}
