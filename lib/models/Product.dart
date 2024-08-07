
class Product {
  String id = '1';
  String title = '', description = '', readMore = '';
  String image = '';
  num rating = 0.0, price = 0.0;
  bool isFavourite = false, isPopular = false;
  String category='';

  Product(
      {required this.id,
      required this.image,
      this.rating = 0.0,
      this.isFavourite = false,
      this.isPopular = false,
      required this.title,
      required this.price,
      required this.description,
        this.category='',
      required this.readMore});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'readMore': readMore,
      'image': image,
      'rating': rating,
      'price': price,
      'isFavourite': isFavourite,
      'category':category,
      'isPopular':isPopular,
    };
  }

  Product.fromJson(Map<String, dynamic> obj) {
    this.id = obj['id'];
    this.title = obj['title'];
    this.description = obj['description'];
    this.readMore = obj['readMore'];
    this.image = obj['image'];
    this.rating = obj['rating'];
    this.price = obj['price'];
    this.isFavourite = obj['isFavourite']??false;
    this.category = obj['category']??'';
    this.isPopular = obj['isPopular']??false;
  }
}
