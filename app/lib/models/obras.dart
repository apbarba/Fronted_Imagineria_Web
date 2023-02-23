import 'dart:ffi';

class Obras {
  String? id;
  String? name;
  double? precio;
  String? titulo;
  String? img;
  String? estado;
  String? fecha;
  String? estilo;
  String? createdAt;
  Null? imaginero;

  Obras(
      {this.id,
      this.name,
      this.precio,
      this.titulo,
      this.img,
      this.estado,
      this.fecha,
      this.estilo,
      this.createdAt,
      this.imaginero});

  Obras.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    precio = json['precio'];
    titulo = json['titulo'];
    img = json['img'];
    estado = json['estado'];
    fecha = json['fecha'];
    estilo = json['estilo'];
    createdAt = json['createdAt'];
    imaginero = json['imaginero'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['precio'] = this.precio;
    data['titulo'] = this.titulo;
    data['img'] = this.img;
    data['estado'] = this.estado;
    data['fecha'] = this.fecha;
    data['estilo'] = this.estilo;
    data['createdAt'] = this.createdAt;
    data['imaginero'] = this.imaginero;
    return data;
  }
}

class ObrasRequest {
  String? name;
  String? precio;
  String? titulo;
  String? img;
  String? estado;
  String? fecha;
  String? estilo;

  ObrasRequest(
      {this.name,
      this.precio,
      this.titulo,
      this.img,
      this.estado,
      this.fecha,
      this.estilo});

  ObrasRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    precio = json['precio'];
    titulo = json['titulo'];
    img = json['img'];
    estado = json['estado'];
    fecha = json['fecha'];
    estilo = json['estilo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['name'] = this.name;
    data['precio'] = this.precio;
    data['titulo'] = this.titulo;
    data['img'] = this.img;
    data['estado'] = this.estado;
    data['fecha'] = this.fecha;
    data['estilo'] = this.estilo;

    return data;
  }
}
