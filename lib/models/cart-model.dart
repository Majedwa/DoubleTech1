// ignore_for_file: file_names

class CartModel {
  final String productId;
  final String categoryId;
  final String categoryName;
  final String productName;
  final String salePrice;
  final String fullPrice;
  final List productImages;
  final String deliveryTime;
  final bool isSale;
  final String productDescription;
  final int productQuantity;
  final dynamic createAt;
  final dynamic updateAt;
  final double productTotalPrice;
  

  CartModel({
    required this.productId,
    required this.productName,
    required this.categoryName,

    required this.salePrice,
    required this.fullPrice,
    required this.productImages,
    required this.deliveryTime,
    required this.isSale,
    required this.productDescription,
    required this.categoryId,
    required this.productQuantity,
    required this.createAt,
    required this.updateAt,
    required this.productTotalPrice,

  });

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'categoryId': categoryId,
      'productName': productName,
      'categoryName': categoryName,

      'salePrice': salePrice,
      'fullPrice': fullPrice,
      'productImages': productImages,
      'deliveryTime': deliveryTime,
      'isSale': isSale,
      'productDescription': productDescription,
      'productQuantity': productQuantity,
      'createAt': createAt,
      'updateAt': updateAt,
      'productTotalPrice': productTotalPrice,

    };
  }

  factory CartModel.fromMap(Map<String, dynamic> json) {
    return CartModel(
        categoryId: json['categoryId'],
        productQuantity: json['productQuantity'],
        categoryName: json['categoryName'],
        createAt: json['createAt'],
        updateAt: json['updateAt'],
        productId: json['productId'],
        productDescription: json['productDescription'],
        productName: json['productName'],
        salePrice: json['salePrice'],
        fullPrice: json['fullPrice'],
        productImages: json['productImages'],
        deliveryTime: json['deliveryTime'],
        isSale: json['isSale'],
        productTotalPrice: json['productTotalPrice'],

        );
  }
}
