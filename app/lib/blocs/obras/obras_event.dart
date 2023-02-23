import 'package:equatable/equatable.dart';

abstract class ObrasEvent extends Equatable {
  const ObrasEvent();

  @override
  List<Object> get props => [];
}

class ObrasButtonPresses extends ObrasEvent {
  final String name;
  final double precio;
  final String titulo;
  final String img;
  final String estado;
  final DateTime fecha;
  final String estilo;

  ObrasButtonPresses(
      {required this.name,
      required this.precio,
      required this.titulo,
      required this.img,
      required this.estado,
      required this.fecha,
      required this.estilo});

  @override
  List<Object> get props => [];
}
