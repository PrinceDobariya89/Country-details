// class CountryModel{
//   String? name;
//   String? capital;
//   String? region;
//   String? language;
//   int? population;
//   String? flag;

//   // CountryModel.min({this.name, this.capital,this.code})


//   CountryModel({this.name,this.capital,this.region,this.language,this.population,this.flag});

//   factory CountryModel.fromJson(Map<String, dynamic> json) {
//     return CountryModel(
//       name: json["name"] as String,
//       capital: json["capital"] as String,
//       region: json["region"] as String,
//       language: json["language"] as String,
//       population: json["population"] as int,
//       flag: json["flag"] as String,
//     );
//   }

// }


// To parse this JSON data, do
//
//     final countryModel = countryModelFromJson(jsonString);

import 'dart:convert';

List<CountryModel> countryModelFromJson(String str) => List<CountryModel>.from(json.decode(str).map((x) => CountryModel.fromJson(x)));

String countryModelToJson(List<CountryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryModel {
    Name? name;
    List<String>? capital;
    Region? region;
    Map<String, String>? languages;
    String? flag;
    int? population;

    CountryModel({
        this.name,
        this.capital,
        this.region,
        this.languages,
        this.flag,
        this.population,
    });

    factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        name: json["name"] == null ? null : Name.fromJson(json["name"]),
        capital: json["capital"] == null ? [] : List<String>.from(json["capital"]!.map((x) => x)),
        region: regionValues.map[json["region"]]!,
        languages: Map.from(json["languages"]!).map((k, v) => MapEntry<String, String>(k, v)),
        flag: json["flag"],
        population: json["population"],
    );

    Map<String, dynamic> toJson() => {
        "name": name?.toJson(),
        "capital": capital == null ? [] : List<dynamic>.from(capital!.map((x) => x)),
        "region": regionValues.reverse[region],
        "languages": Map.from(languages!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "flag": flag,
        "population": population,
    };
}

class Name {
    String? common;
    String? official;
    Map<String, NativeName>? nativeName;

    Name({
        this.common,
        this.official,
        this.nativeName,
    });

    factory Name.fromJson(Map<String, dynamic> json) => Name(
        common: json["common"],
        official: json["official"],
        nativeName: Map.from(json["nativeName"]!).map((k, v) => MapEntry<String, NativeName>(k, NativeName.fromJson(v))),
    );

    Map<String, dynamic> toJson() => {
        "common": common,
        "official": official,
        "nativeName": Map.from(nativeName!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    };
}

class NativeName {
    String? official;
    String? common;

    NativeName({
        this.official,
        this.common,
    });

    factory NativeName.fromJson(Map<String, dynamic> json) => NativeName(
        official: json["official"],
        common: json["common"],
    );

    Map<String, dynamic> toJson() => {
        "official": official,
        "common": common,
    };
}

enum Region {
    AFRICA,
    AMERICAS,
    ASIA,
    EUROPE,
    OCEANIA
}

final regionValues = EnumValues({
    "Africa": Region.AFRICA,
    "Americas": Region.AMERICAS,
    "Asia": Region.ASIA,
    "Europe": Region.EUROPE,
    "Oceania": Region.OCEANIA
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
