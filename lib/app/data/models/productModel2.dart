import 'dart:convert';

List<Product> productListFromJson(String val) => List<Product>.from(
    json.decode(val)['data'].map((val) => Product.productFromJson(val)));

class Product {
  final int id;
  final String name;
  final int price;
  final String description;
  final String pelukis;
  final List<String> images;
  // final List<Tag> tags;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.pelukis,
    required this.images,
    // required this.tags,
  });

  factory Product.productFromJson(Map<String, dynamic> data) => Product(
        id: data['id'],
        name: data['attributes']['name'],
        price: data['attributes']['price'],
        description: data['attributes']['description'],
        pelukis: data['attributes']['pelukis'],
        images: List<String>.from(data['attributes']['images']['data']
            .map((image) => image['attributes']['url'])),
        // tags: List<Tag>.from(
        //     data['attributes']['tags'].map((val) => Tag.fromJson(val))),
      );
}
