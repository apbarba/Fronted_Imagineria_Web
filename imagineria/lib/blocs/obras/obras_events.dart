import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class ObrasEvent extends Equatable{

  const ObrasEvent();
}

class ObrasLoadingState extends ObrasEvent{

  @override
  List<Object?> get props => [];
}