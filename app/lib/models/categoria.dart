class CategoriaResponse {
  CategoriaResponse({
    required this.content,
    required this.pageable,
    required this.last,
    required this.totalElements,
    required this.totalPages,
    required this.size,
    required this.number,
    required this.sort,
    required this.first,
    required this.numberOfElements,
    required this.empty,
  });
  late final List<Categoria> content;
  late final Pageable pageable;
  late final bool last;
  late final int totalElements;
  late final int totalPages;
  late final int size;
  late final int number;
  late final Sort sort;
  late final bool first;
  late final int numberOfElements;
  late final bool empty;

  CategoriaResponse.fromJson(Map<String, dynamic> json) {
    content =
        List.from(json['content']).map((e) => Categoria.fromJson(e)).toList();
    pageable = Pageable.fromJson(json['pageable']);
    last = json['last'];
    totalElements = json['totalElements'];
    totalPages = json['totalPages'];
    size = json['size'];
    number = json['number'];
    sort = Sort.fromJson(json['sort']);
    first = json['first'];
    numberOfElements = json['numberOfElements'];
    empty = json['empty'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['content'] = content.map((e) => e.toJson()).toList();
    _data['pageable'] = pageable.toJson();
    _data['last'] = last;
    _data['totalElements'] = totalElements;
    _data['totalPages'] = totalPages;
    _data['size'] = size;
    _data['number'] = number;
    _data['sort'] = sort.toJson();
    _data['first'] = first;
    _data['numberOfElements'] = numberOfElements;
    _data['empty'] = empty;
    return _data;
  }
}

class Categoria {
  Categoria({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.obras,
  });
  late final String id;
  late final String nombre;
  late final String descripcion;
  late final List<Obras> obras;

  Categoria.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    descripcion = json['descripcion'];
    obras = List.from(json['obras']).map((e) => Obras.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['nombre'] = nombre;
    _data['descripcion'] = descripcion;
    _data['obras'] = obras.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Obras {
  Obras({
    required this.id,
    required this.name,
    required this.precio,
    required this.titulo,
    required this.img,
    required this.estado,
    required this.fecha,
    required this.estilo,
    this.createdAt,
    required this.imaginero,
    this.nombreImaginero,
    this.user,
  });
  late final String id;
  late final String name;
  late final dynamic precio;
  late final String titulo;
  late final String img;
  late final String estado;
  late final String fecha;
  late final String estilo;
  late final String? createdAt;
  late final dynamic? imaginero;
  late final String? nombreImaginero;
  late final String? user;

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
    nombreImaginero = json['nombreImaginero'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['precio'] = precio;
    _data['titulo'] = titulo;
    _data['img'] = img;
    _data['estado'] = estado;
    _data['fecha'] = fecha;
    _data['estilo'] = estilo;
    _data['createdAt'] = createdAt;
    _data['imaginero'] = imaginero;
    _data['nombreImaginero'] = nombreImaginero;
    _data['user'] = user;
    return _data;
  }
}

class Imaginero {
  Imaginero({
    required this.id,
    required this.name,
    required this.edad,
    required this.localidad,
  });
  late final String id;
  late final String name;
  late final int edad;
  late final String localidad;

  Imaginero.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    edad = json['edad'];
    localidad = json['localidad'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['edad'] = edad;
    _data['localidad'] = localidad;
    return _data;
  }
}

class Pageable {
  Pageable({
    required this.sort,
    required this.offset,
    required this.pageSize,
    required this.pageNumber,
    required this.paged,
    required this.unpaged,
  });
  late final Sort sort;
  late final int offset;
  late final int pageSize;
  late final int pageNumber;
  late final bool paged;
  late final bool unpaged;

  Pageable.fromJson(Map<String, dynamic> json) {
    sort = Sort.fromJson(json['sort']);
    offset = json['offset'];
    pageSize = json['pageSize'];
    pageNumber = json['pageNumber'];
    paged = json['paged'];
    unpaged = json['unpaged'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['sort'] = sort.toJson();
    _data['offset'] = offset;
    _data['pageSize'] = pageSize;
    _data['pageNumber'] = pageNumber;
    _data['paged'] = paged;
    _data['unpaged'] = unpaged;
    return _data;
  }
}

class Sort {
  Sort({
    required this.empty,
    required this.sorted,
    required this.unsorted,
  });
  late final bool empty;
  late final bool sorted;
  late final bool unsorted;

  Sort.fromJson(Map<String, dynamic> json) {
    empty = json['empty'];
    sorted = json['sorted'];
    unsorted = json['unsorted'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['empty'] = empty;
    _data['sorted'] = sorted;
    _data['unsorted'] = unsorted;
    return _data;
  }
}
