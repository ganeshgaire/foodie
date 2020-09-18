class Item {
  int id;
  String name;
  dynamic price;
  String image;
  String detail;
  dynamic rating;
  String category;

  Item({this.id, this.name, this.price, this.image, this.detail,this.rating,this.category});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
        name: json['name'],
        price: json['price'],
        image: json['image'],
        detail: json['description'],
        rating:json['rating'],
        category: json['category_name']);
  }
}
