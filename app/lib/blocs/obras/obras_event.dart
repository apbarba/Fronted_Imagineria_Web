import 'package:equatable/equatable.dart';

abstract class ObrasEvent extends Equatable {
  const ObrasEvent();

  @override
  List<Object> get props => [];
}

class ObrasButtonPresses extends ObrasEvent {
  final String name;
  final String precio;
  final String titulo;
  final String img;
  final String estado;
  final String fecha;
  final String estilo;
  final String categoria;

  ObrasButtonPresses(
      {required this.name,
      required this.precio,
      required this.titulo,
      required this.img,
      required this.estado,
      required this.fecha,
      required this.estilo,
      required this.categoria});

  @override
  List<Object> get props => [];
}
