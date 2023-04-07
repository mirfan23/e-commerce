import 'dart:convert';

List<Product> productListFromJson(String val) => List<Product>.from(
    json.decode(val)['data'].map((val) => Product.productFromJson(val)));

class Product {
  final int id;
  final String name;
  final int price;
  final String description;
  final String pelukis;
  String? ukuran;
  final List<String> images;
  // final List<Category>? category;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.pelukis,
    this.ukuran,
    required this.images,
    // this.category,
  });

  factory Product.productFromJson(Map<String, dynamic> data) => Product(
        id: data['id'],
        name: data['attributes']['name'],
        price: data['attributes']['price'],
        description: data['attributes']['description'],
        pelukis: data['attributes']['pelukis'],
        ukuran: data['attributes']['ukuran'],
        images: List<String>.from(data['attributes']['images']['data']
            .map((image) => image['attributes']['url'])),
        // category: List<Category>.from(data['attributes']['category']['data']
        //     .map((val) => Category.fromJson(val))),
      );
}
