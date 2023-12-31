class ProductSort {
  static const int latest = 0;
  static const int popular = 1;
  static const int priceHighToLow = 2;
  static const int priceLowToHigh = 3;

  static const List<String> name = [
    'جدید ترین',
    'پربازدید ترین',
    'قیمت نزولی',
    'قیمت سعودی',
  ];
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
        previousPrice =
            json['previous_price'] ?? json['price'] + json['discount'],
        discount = json['discount'];
}
