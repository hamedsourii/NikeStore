class ProductSort {
  static const int latest = 0;
  static const int populer = 1;
  static const int priceHighToLow = 2;
  static const int priceLowToHigh = 3;
}

class ProductEntity {
  final int id;
  final String title;
  final String imageUrl;
  final int price;
  final int discount;
  final int previousPrice;

  ProductEntity.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        imageUrl = json['image'],
        price = json['price'],
        discount = json['discount'],
        previousPrice = json['previous_price'] ?? json['price']+json['discount'];
}
