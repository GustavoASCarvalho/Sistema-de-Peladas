import 'dart:convert';

class SoccerField {
  final String name;
  final String address;
  final String description;
  final String urlImage;
  final bool segunda;
  final String segundaStart;
  final String segundaEnd;
  final bool terca;
  final String tercaStart;
  final String tercaEnd;
  final bool quarta;
  final String quartaStart;
  final String quartaEnd;
  final bool quinta;
  final String quintaStart;
  final String quintaEnd;
  final bool sexta;
  final String sextaStart;
  final String sextaEnd;
  final bool sabado;
  final String sabadoStart;
  final String sabadoEnd;
  final bool domingo;
  final String domingoStart;
  final String domingoEnd;

  SoccerField(
    this.name,
    this.address,
    this.description,
    this.urlImage,
    this.segunda,
    this.segundaStart,
    this.segundaEnd,
    this.terca,
    this.tercaStart,
    this.tercaEnd,
    this.quarta,
    this.quartaStart,
    this.quartaEnd,
    this.quinta,
    this.quintaStart,
    this.quintaEnd,
    this.sexta,
    this.sextaStart,
    this.sextaEnd,
    this.sabado,
    this.sabadoStart,
    this.sabadoEnd,
    this.domingo,
    this.domingoStart,
    this.domingoEnd,
  );

  SoccerField copyWith({
    String? name,
    String? address,
    String? description,
    String? urlImage,
    bool? segunda,
    String? segundaStart,
    String? segundaEnd,
    bool? terca,
    String? tercaStart,
    String? tercaEnd,
    bool? quarta,
    String? quartaStart,
    String? quartaEnd,
    bool? quinta,
    String? quintaStart,
    String? quintaEnd,
    bool? sexta,
    String? sextaStart,
    String? sextaEnd,
    bool? sabado,
    String? sabadoStart,
    String? sabadoEnd,
    bool? domingo,
    String? domingoStart,
    String? domingoEnd,
  }) {
    return SoccerField(
      name ?? this.name,
      address ?? this.address,
      description ?? this.description,
      urlImage ?? this.urlImage,
      segunda ?? this.segunda,
      segundaStart ?? this.segundaStart,
      segundaEnd ?? this.segundaEnd,
      terca ?? this.terca,
      tercaStart ?? this.tercaStart,
      tercaEnd ?? this.tercaEnd,
      quarta ?? this.quarta,
      quartaStart ?? this.quartaStart,
      quartaEnd ?? this.quartaEnd,
      quinta ?? this.quinta,
      quintaStart ?? this.quintaStart,
      quintaEnd ?? this.quintaEnd,
      sexta ?? this.sexta,
      sextaStart ?? this.sextaStart,
      sextaEnd ?? this.sextaEnd,
      sabado ?? this.sabado,
      sabadoStart ?? this.sabadoStart,
      sabadoEnd ?? this.sabadoEnd,
      domingo ?? this.domingo,
      domingoStart ?? this.domingoStart,
      domingoEnd ?? this.domingoEnd,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'description': description,
      'urlImage': urlImage,
      'segunda': segunda,
      'segundaStart': segundaStart,
      'segundaEnd': segundaEnd,
      'terca': terca,
      'tercaStart': tercaStart,
      'tercaEnd': tercaEnd,
      'quarta': quarta,
      'quartaStart': quartaStart,
      'quartaEnd': quartaEnd,
      'quinta': quinta,
      'quintaStart': quintaStart,
      'quintaEnd': quintaEnd,
      'sexta': sexta,
      'sextaStart': sextaStart,
      'sextaEnd': sextaEnd,
      'sabado': sabado,
      'sabadoStart': sabadoStart,
      'sabadoEnd': sabadoEnd,
      'domingo': domingo,
      'domingoStart': domingoStart,
      'domingoEnd': domingoEnd,
    };
  }

  factory SoccerField.fromMap(Map<String, dynamic> map) {
    return SoccerField(
      map['name'] ?? '',
      map['address'] ?? '',
      map['description'] ?? '',
      map['urlImage'] ?? '',
      map['segunda'] ?? false,
      map['segundaStart'] ?? '',
      map['segundaEnd'] ?? '',
      map['terca'] ?? false,
      map['tercaStart'] ?? '',
      map['tercaEnd'] ?? '',
      map['quarta'] ?? false,
      map['quartaStart'] ?? '',
      map['quartaEnd'] ?? '',
      map['quinta'] ?? false,
      map['quintaStart'] ?? '',
      map['quintaEnd'] ?? '',
      map['sexta'] ?? false,
      map['sextaStart'] ?? '',
      map['sextaEnd'] ?? '',
      map['sabado'] ?? false,
      map['sabadoStart'] ?? '',
      map['sabadoEnd'] ?? '',
      map['domingo'] ?? false,
      map['domingoStart'] ?? '',
      map['domingoEnd'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SoccerField.fromJson(String source) =>
      SoccerField.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SoccerField(name: $name, address: $address, description: $description, urlImage: $urlImage, segunda: $segunda, segundaStart: $segundaStart, segundaEnd: $segundaEnd, terca: $terca, tercaStart: $tercaStart, tercaEnd: $tercaEnd, quarta: $quarta, quartaStart: $quartaStart, quartaEnd: $quartaEnd, quinta: $quinta, quintaStart: $quintaStart, quintaEnd: $quintaEnd, sexta: $sexta, sextaStart: $sextaStart, sextaEnd: $sextaEnd, sabado: $sabado, sabadoStart: $sabadoStart, sabadoEnd: $sabadoEnd, domingo: $domingo, domingoStart: $domingoStart, domingoEnd: $domingoEnd)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SoccerField &&
        other.name == name &&
        other.address == address &&
        other.description == description &&
        other.urlImage == urlImage &&
        other.segunda == segunda &&
        other.segundaStart == segundaStart &&
        other.segundaEnd == segundaEnd &&
        other.terca == terca &&
        other.tercaStart == tercaStart &&
        other.tercaEnd == tercaEnd &&
        other.quarta == quarta &&
        other.quartaStart == quartaStart &&
        other.quartaEnd == quartaEnd &&
        other.quinta == quinta &&
        other.quintaStart == quintaStart &&
        other.quintaEnd == quintaEnd &&
        other.sexta == sexta &&
        other.sextaStart == sextaStart &&
        other.sextaEnd == sextaEnd &&
        other.sabado == sabado &&
        other.sabadoStart == sabadoStart &&
        other.sabadoEnd == sabadoEnd &&
        other.domingo == domingo &&
        other.domingoStart == domingoStart &&
        other.domingoEnd == domingoEnd;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        address.hashCode ^
        description.hashCode ^
        urlImage.hashCode ^
        segunda.hashCode ^
        segundaStart.hashCode ^
        segundaEnd.hashCode ^
        terca.hashCode ^
        tercaStart.hashCode ^
        tercaEnd.hashCode ^
        quarta.hashCode ^
        quartaStart.hashCode ^
        quartaEnd.hashCode ^
        quinta.hashCode ^
        quintaStart.hashCode ^
        quintaEnd.hashCode ^
        sexta.hashCode ^
        sextaStart.hashCode ^
        sextaEnd.hashCode ^
        sabado.hashCode ^
        sabadoStart.hashCode ^
        sabadoEnd.hashCode ^
        domingo.hashCode ^
        domingoStart.hashCode ^
        domingoEnd.hashCode;
  }
}
