import 'package:equatable/equatable.dart';

abstract class ObrasEvent extends Equatable {
  const ObrasEvent();

  @override
  List<Object> get props => [];
}

class GetObrasList extends ObrasEvent {}
