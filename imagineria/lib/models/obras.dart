class ObrasModel {
  String? id;
  String? name;
  double? precio;
  String? titulo;
  String? img;
  String? estado;
  DateTime? fecha;
  String? estilo;

  ObrasModel(
      {this.id,
      this.name,
      this.precio,
      this.titulo,
      this.img,
      this.estado,
      this.fecha,
      this.estilo});

  factory ObrasModel.fromJson(Map<String, dynamic> json) {
    return ObrasModel(
        id: json['id'],
        name: json['name'],
        precio: json['precio'],
        titulo: json['titulo'],
        img: json['img'],
        estado: json['estado'],
        fecha: json['fecha'],
        estilo: json['estilo']);
  }

  Map<String, dynamic> toJson(){

    final Map<String, dynamic> data = <String, dynamic>{};

        data['id'] = id;
        data['name'] = name;
        data['precio'] = precio;
        data['titulo'] = titulo;
        data['img'] = img;
        data['estado'] = estado;
        data['fecha'] = fecha;
        data['estilo'] = estilo;

        return data;  
        
        }
}
