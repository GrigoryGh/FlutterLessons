class Product {
  String? productName;
  int? price;
  bool? isAvailable;
  List<String>? materials;

  Product({this.productName, this.price, this.isAvailable, this.materials});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productName: json['product_name'] as String,
      price: json['price'] as int,
      isAvailable: json['is_available'] as bool,
      // materials: json['materials'] as List<String>,
    );
  }
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'product_name': productName,
      'price': price,
      'is_available': isAvailable,
    };
  }
}
