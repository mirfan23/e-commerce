// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    required this.data,
    required this.meta,
  });

  List<Datum> data;
  Meta meta;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "meta": meta.toJson(),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.attributes,
  });

  int id;
  DatumAttributes attributes;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        attributes: DatumAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
      };
}

class DatumAttributes {
  DatumAttributes({
    required this.title,
    required this.description,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.pelukis,
    required this.colors,
    required this.categories,
    required this.thumbnails,
  });

  String title;
  String description;
  int price;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime publishedAt;
  String pelukis;
  String colors;
  String categories;
  Thumbnails thumbnails;

  factory DatumAttributes.fromJson(Map<String, dynamic> json) =>
      DatumAttributes(
        title: json["title"],
        description: json["description"],
        price: json["price"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
        pelukis: json["pelukis"],
        colors: json["colors"],
        categories: json["categories"],
        thumbnails: Thumbnails.fromJson(json["thumbnails"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "price": price,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
        "pelukis": pelukis,
        "colors": colors,
        "categories": categories,
        "thumbnails": thumbnails.toJson(),
      };
}

class Thumbnails {
  Thumbnails({
    required this.data,
  });

  Data data;

  factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.attributes,
  });

  int id;
  DataAttributes attributes;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        attributes: DataAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
      };
}

class DataAttributes {
  DataAttributes({
    required this.name,
    this.alternativeText,
    this.caption,
    required this.width,
    required this.height,
    required this.formats,
    required this.hash,
    required this.ext,
    required this.mime,
    required this.size,
    required this.url,
    this.previewUrl,
    required this.provider,
    this.providerMetadata,
    required this.createdAt,
    required this.updatedAt,
  });

  String name;
  dynamic alternativeText;
  dynamic caption;
  int width;
  int height;
  Formats formats;
  String hash;
  String ext;
  String mime;
  double size;
  String url;
  dynamic previewUrl;
  String provider;
  dynamic providerMetadata;
  DateTime createdAt;
  DateTime updatedAt;

  factory DataAttributes.fromJson(Map<String, dynamic> json) => DataAttributes(
        name: json["name"],
        alternativeText: json["alternativeText"],
        caption: json["caption"],
        width: json["width"],
        height: json["height"],
        formats: Formats.fromJson(json["formats"]),
        hash: json["hash"],
        ext: json["ext"],
        mime: json["mime"],
        size: json["size"]?.toDouble(),
        url: json["url"],
        previewUrl: json["previewUrl"],
        provider: json["provider"],
        providerMetadata: json["provider_metadata"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "alternativeText": alternativeText,
        "caption": caption,
        "width": width,
        "height": height,
        "formats": formats.toJson(),
        "hash": hash,
        "ext": ext,
        "mime": mime,
        "size": size,
        "url": url,
        "previewUrl": previewUrl,
        "provider": provider,
        "provider_metadata": providerMetadata,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class Formats {
  Formats({
    required this.thumbnail,
    this.small,
    this.medium,
    this.large,
  });

  Thumbnail thumbnail;
  Thumbnail? small;
  Thumbnail? medium;
  Thumbnail? large;

  factory Formats.fromJson(Map<String, dynamic> json) => Formats(
        thumbnail: Thumbnail.fromJson(json["thumbnail"]),
        small: json["small"] == null ? null : Thumbnail.fromJson(json["small"]),
        medium:
            json["medium"] == null ? null : Thumbnail.fromJson(json["medium"]),
        large: json["large"] == null ? null : Thumbnail.fromJson(json["large"]),
      );

  Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail.toJson(),
        "small": small?.toJson(),
        "medium": medium?.toJson(),
        "large": large?.toJson(),
      };
}

class Thumbnail {
  Thumbnail({
    required this.name,
    required this.hash,
    required this.ext,
    required this.mime,
    this.path,
    required this.width,
    required this.height,
    required this.size,
    required this.url,
  });

  String name;
  String hash;
  String ext;
  String mime;
  dynamic path;
  int width;
  int height;
  double size;
  String url;

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        name: json["name"],
        hash: json["hash"],
        ext: json["ext"],
        mime: json["mime"],
        path: json["path"],
        width: json["width"],
        height: json["height"],
        size: json["size"]?.toDouble(),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "hash": hash,
        "ext": ext,
        "mime": mime,
        "path": path,
        "width": width,
        "height": height,
        "size": size,
        "url": url,
      };
}

class Meta {
  Meta({
    required this.pagination,
  });

  Pagination pagination;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "pagination": pagination.toJson(),
      };
}

class Pagination {
  Pagination({
    required this.page,
    required this.pageSize,
    required this.pageCount,
    required this.total,
  });

  int page;
  int pageSize;
  int pageCount;
  int total;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        page: json["page"],
        pageSize: json["pageSize"],
        pageCount: json["pageCount"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "pageSize": pageSize,
        "pageCount": pageCount,
        "total": total,
      };
}
