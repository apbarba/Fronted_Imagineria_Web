import 'package:equatable/equatable.dart';

abstract class ObrasEvent extends Equatable {
  const ObrasEvent();

  @override
  List<Object> get props => [];
}

class Loading extends ObrasEvent {}

class ObrasPressed extends ObrasEvent{

  final String id;

  ObrasPressed({required this.id});

  @override
  List<Object> get props => [id];
}