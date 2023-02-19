class ObrasModel{

  final String name;
  final double precio;
  final String titulo;
  final String img;
  final String estado;
  final DateTime fecha;
  final String estilo;

  ObrasModel(
    {
      required this.name,
      required this.precio,
      required this.titulo,
      required this.img,
      required this.estado,
      required this.fecha,
      required this.estilo
    }
  );

  factory ObrasModel.fromJson(Map<String, dynamic> json) {

    return ObrasModel(
      name: json['name'], 
      precio: json['precio'], 
      titulo: json['titulo'], 
      img: json['img'], 
      estado: json['estado'], 
      fecha: json['fecha'], 
      estilo: json['estilo']);
  }
}